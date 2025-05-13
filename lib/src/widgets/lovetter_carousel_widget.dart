import 'package:belohvims_web/src/providers/app_state_provider.dart';
import 'package:belohvims_web/src/widgets/shows_dialogs_lovetter.dart';
import 'package:belohvims_web/src/widgets/text_outline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:belohvims_web/src/models/image_with_description_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LovetterCarouselWidget extends StatefulWidget {
  final List<ImageWithDescriptionModel>? imagens;

  const LovetterCarouselWidget({
    super.key,
    this.imagens,
  });

  @override
  State<LovetterCarouselWidget> createState() => _LovetterCarouselWidgetState();
}

class _LovetterCarouselWidgetState extends State<LovetterCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imgs = widget.imagens ?? [];
    final appState = Provider.of<AppStateProvider>(context);

    return Column(
      children: [
        FlutterCarousel(
            options: FlutterCarouselOptions(
              height: 250,
              enableInfiniteScroll: imgs.length > 1,
              autoPlay: imgs.length > 1,
              autoPlayCurve: Curves.easeInOutSine,
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              autoPlayInterval: const Duration(seconds: 5),
              slideIndicator: CircularWaveSlideIndicator(),
              viewportFraction: 0.56,
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              onPageChanged: (idx, _) => setState(() => _currentIndex = idx),
            ),
            items: widget.imagens?.map((imageWithDesc) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ShowsDialogsLovetter()
                              .showDialogImageDescription(
                            imageWithDesc.description , imageWithDesc.imagePath
                          );
                        });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageWithDesc.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            }).toList()),
        const SizedBox(height: 10),
        if (imgs.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextOutline(
             text:  imgs[_currentIndex].description,

              textStyle: GoogleFonts.sriracha(),
              dx: 1,
              dy: 1,
              blurRadius: 20,
              colorBorder: Colors.amber,
              colorText: Colors.white,
            ),
          ),
      ],
    );
  }

  void _showDescriptionDialog(
      BuildContext context, String description, AppStateProvider appState) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Descrição da Imagem"),
        content: description.isNotEmpty
            ? Text("Sem descrição", style: GoogleFonts.merienda())
            : RichText(
                textAlign: TextAlign.center,
                text: appState.parseEmojiText(
                  description,
                  TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Fechar"),
          ),
        ],
      ),
    );
  }
}
