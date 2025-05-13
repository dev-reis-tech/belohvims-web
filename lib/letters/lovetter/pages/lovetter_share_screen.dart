import 'dart:ui';

import 'package:belohvims_web/src/models/lovetter_model.dart';
import 'package:belohvims_web/src/providers/app_state_provider.dart';
import 'package:belohvims_web/src/widgets/lovetter_carousel_widget.dart';
import 'package:belohvims_web/src/widgets/time_counter_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class LovetterShareScreen extends StatefulWidget {
  final String token;
  const LovetterShareScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<LovetterShareScreen> createState() => _LovetterShareScreenState();
}

class _LovetterShareScreenState extends State<LovetterShareScreen> {
  //  String get token {
  Future<LovetterModel?> _fetchLovetter() async {
    final query = await FirebaseFirestore.instance
        .collectionGroup('lovetters')
        .where('shareToken', isEqualTo: widget.token)
        .limit(1)
        .get();
    if (query.docs.isEmpty) return null;
    return LovetterModel.fromJson(query.docs.first.data());
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);
    // Se não tiver token, mostramos a mensagem personalizada:
    if (widget.token.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Carta Compartilhada')),
        body: const Center(
          child: Text(
            'Faça sua carta e volte aqui depois',
            style: TextStyle(fontSize: 18, color: Colors.purple),
          ),
        ),
      );
    }
    final LovetterModel lovetterWeb;
    // Caso contrário, carregamos do Firestore:
    return FutureBuilder<LovetterModel?>(
      future: _fetchLovetter(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          final code = (snap.error is FirebaseException)
              ? (snap.error as FirebaseException).code
              : 'unknown';
          final msg = code == 'permission-denied'
              ? 'Você não tem permissão para ver esta carta.'
              : 'Ocorreu um erro ($code).';
          return Center(
              child: Text(msg, style: TextStyle(color: Colors.amber)));
        }
        final lovetter = snap.data;
        if (lovetter == null) {
          return const Center(
              child: Text(
            'Carta não encontrada',
            style: TextStyle(color: Colors.amber),
          ));
        }
        return appState.isUnlocked
            ? _ShareLovetterPage(lovetter: lovetter)
            : _OpenLovetterWidget(
                lovetter: lovetter,
              );
      },
    );
  }
}

class _ShareLovetterPage extends StatefulWidget {
  final LovetterModel lovetter;
  const _ShareLovetterPage({Key? key, required this.lovetter})
      : super(key: key);

  @override
  State<_ShareLovetterPage> createState() => _ShareLovetterPageState();
}

class _ShareLovetterPageState extends State<_ShareLovetterPage> {
  late final AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    final url = widget.lovetter.audioUrl;
    if (url != null && url.isNotEmpty) {
      _player.setUrl(url).then((_) {
        _player.setVolume(0.3);
        _player.play();
      });
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lovetterWeb = widget.lovetter;
    return Scaffold(
      appBar: AppBar(
        title: Text(lovetterWeb.lovetterName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (lovetterWeb.specialDate != null) ...[
              const SizedBox(height: 20),
              TimeCounterWidget(pastDate: lovetterWeb.specialDate!),
            ],
            if (lovetterWeb.images != null &&
                lovetterWeb.images!.isNotEmpty) ...[
              LovetterCarouselWidget(imagens: lovetterWeb.images!),
              const SizedBox(height: 12),
            ],
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.amber, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Text(
                lovetterWeb.text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class _OpenLovetterWidget extends StatelessWidget {
  final LovetterModel? lovetter;

  _OpenLovetterWidget({
    Key? key,
    this.lovetter,
  }) : super(key: key);
  // bool isUnlocked = false;

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);
    return Scaffold(
          body: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appState.isUnlocked == false
                    ? Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Text("De: ${lovetter?.from}",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Text("Para: ${lovetter?.to}",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                    )
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                if (lovetter!.lovetterPassword.isNotEmpty &&
                    !appState.isUnlocked) ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Digite a senha",
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.lock_open),
                          onPressed: () {
                            if (passwordController.text ==
                                lovetter?.lovetterPassword) {
                              appState.toggleIsUnlocked();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Senha incorreta!")),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  if (lovetter?.lovetterPasswordHint != null)
                    Text("Dica: ${lovetter?.lovetterPasswordHint}",
                        style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 20),
                ] else ...[
                  // Row(
                  //   children: [
                  //     Text("De: ${lovetterSave.lovetterSaveModel?.from}",
                  //         style: const TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.bold)),
                  //     Text("Para: ${lovetterSave.lovetterSaveModel?.to}",
                  //         style: const TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.bold)),
                  //   ],
                  // ),
                  appState.isUnlocked == false
                      ? ElevatedButton(
                          onPressed: () => appState.toggleIsUnlocked(),
                          child: const Text("Abrir Carta"),
                        )
                      : const SizedBox.shrink(),
                ],
              ],
            ),
        );
       
  }
}
