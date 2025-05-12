import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:belohvims_web/src/widgets/text_outline.dart';


class ShowsDialogsLovetter {

  static AlertDialog showDialogImageDescription(String? imageDescription) {
    if (imageDescription != null && imageDescription.isNotEmpty) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(179, 0, 0, 0),
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
        content: SizedBox(
          height: 350,
          width: 400,
          child: Center(child: Text(imageDescription)),
        ),
      );
    }
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
  }

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