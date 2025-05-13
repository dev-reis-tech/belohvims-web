import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:belohvims_web/src/widgets/text_outline.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;


class ShowsDialogsLovetter {

   Future<ui.Image> _loadUiImageFromUrl(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode != 200) {
    throw Exception('Falha ao carregar imagem: ${response.statusCode}');
  }
  final Uint8List bytes = response.bodyBytes;
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  return frame.image;
}

AlertDialog showDialogImageDescription(
    String? imageDescription, String? imageUrl) {
  if (imageDescription != null && imageDescription.isNotEmpty) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(179, 0, 0, 0),
      title: Text(
        "Descrição da Imagem",
        style: GoogleFonts.roboto(
          fontSize: 28,
          color: Colors.purple,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 16,
              color: Colors.pink,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      content: FutureBuilder<ui.Image>(
        future: _loadUiImageFromUrl(imageUrl ?? ''),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snap.hasError || snap.data == null) {
            return const SizedBox(
              height: 200,
              child: Center(child: Icon(Icons.broken_image, size: 48)),
            );
          }

          final img = snap.data!;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1) Widget que respeita o aspect ratio real da imagem
                AspectRatio(
                  aspectRatio: img.width / img.height,
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 16),

                // 2) Sua descrição abaixo
                Text(
                  imageDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  } else {
    // Se não houver descrição, retorna um diálogo simples
    return AlertDialog(
      backgroundColor: const Color.fromARGB(110, 0, 0, 0),
      title: TextOutline(
        colorText: Colors.purple,
        colorBorder: Colors.pink,
        textStyle: GoogleFonts.roboto(
          fontSize: 35,
        ),
        text: "Descrição da Imagem",
        blurRadius: 16,
        dx: 1,
        dy: 1,
      ),
      content: const SizedBox(
        height: 350,
        width: 400,
        child: Center(child: Text("Imagem sem Descrição")),
      ),
    );
  }}

  
  static AlertDialog showTextDescriptionFormField(double heightDialog,
      String description, void Function(String)? onChanged) {
    return AlertDialog(
        backgroundColor: Colors.purple,
        title: TextOutline(
          colorText: Colors.purple,
          colorBorder: Colors.pink,
          textStyle: GoogleFonts.roboto(
            fontSize: 35,
          ),
          text: "Descrição do Texto",
          blurRadius: 16,
          dx: 1,
          dy: 1,
        ),
        content: SizedBox(
          height: heightDialog,
          width: 400,
          child: TextFormField(
            initialValue: description,
            onChanged: onChanged,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Descrição',
              hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            ),
          ),
        ));
  }
}

/* InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Como deseja compartilhar a carta?',
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        // chama sua lógica de enviar ao partner
                        Provider.of<LovetterFormSaveProvider>(context, listen: false)
                            .sendToPartner(context);
                      },
                      child: Text('Enviar ao parceiro',
                        style: GoogleFonts.roboto(color: Colors.purple),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        // chama sua lógica de compartilhar por link
                        Provider.of<LovetterFormSaveProvider>(context, listen: false)
                            .shareByLink(context);
                      },
                      child: Text('Compartilhar por link',
                        style: GoogleFonts.roboto(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              alignment: Alignment.center,
              child: TextOutline(
                colorText: Colors.purple,
                colorBorder: Colors.amber,
                text: "Como deseja compartilhar a carta?",
                textStyle: GoogleFonts.roboto(fontSize: 16),
                blurRadius: 1,
                dx: 1,
                dy: 1,
              ),
            ),
          ), */