import 'package:belohvims_web/src/providers/app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:belohvims_web/l10n/text_translation_converter.dart';
import 'package:belohvims_web/src/widgets/text_outline.dart';


enum FontTypeMainPage {
  descriptionManPage,
  titleLetters,
  clickDescription,
  popUpButtonSeeLetters
}

enum FontTypeMainDrawer {
  nameUser,
  addPartner,
  exitAccount,
  userInfo,
  changeLanguage,
  loginWithGoogle,
  smInstagram,
  smWhatsapp
}

enum FontTypeLovetterForm { addAudio }

class FontsAppTheme {
  static Widget fontsMainPage({
    required FontTypeMainPage type,
    required String text,
    required BuildContext context,
  }) {
    final translation =
        GetIt.I<TextTranslationConverter>();
    final appState = GetIt.I<AppStateProvider>();
    final sizeScreen = appState.getSizeHeight(context);
    switch (type) {
      case FontTypeMainPage.descriptionManPage:
        return TextOutline(
            text: translation.stringsMainPageAndMainDrawer(
                    context, 'descriptionMainPage') ??
                '',
            colorBorder: Colors.amber,
            textStyle: GoogleFonts.merienda(
              fontSize: appState.responsiveMobile(sizeScreen,
                  big: 28, small: 22, fractionPixel: 0.01),
              color: Colors.white,
            ),
            blurRadius: 16,
            dx: 1,
            dy: 1);
      case FontTypeMainPage.titleLetters:
        return TextOutline(
            text: text,
            colorText: Colors.purple,
            colorBorder: Colors.deepPurple,
            textStyle: GoogleFonts.sriracha(
              fontSize: appState.responsiveMobile(sizeScreen,
                  big: 18, fractionPixel: 0.01, small: 12),
              fontWeight: null,
            ),
            blurRadius: 16,
            dx: 1,
            dy: 1);
      case FontTypeMainPage.clickDescription:
        return TextOutline(
            colorText: Colors.purple,
            colorBorder: Colors.deepPurple,
            text: translation.stringsMainPageAndMainDrawer(
                    context, 'clickDescription') ??
                '',
            textStyle: GoogleFonts.sriracha(
              fontSize: appState.getSizeHeight(context, percentSize: .014),
              fontWeight: null,
            ),
            blurRadius: 16,
            dx: 1,
            dy: 1);

      case FontTypeMainPage.popUpButtonSeeLetters:
        return TextOutline(
          colorText: Colors.purple,
          colorBorder: Colors.black,
          text: 'Ver Cartas',
          textStyle: GoogleFonts.poppins(
            fontSize: appState.responsiveMobile(sizeScreen,
                big: 14,
                fractionPixel: 0.01,
                small: 12,
                defaultt: 14,
                medium: 14,
                superSmall: 12),
            fontWeight: FontWeight.bold,
          ),
          blurRadius: 1,
          dx: 1,
          dy: 1,
        );
    }
  }

  static Widget fontsMainDrawer(
      {required BuildContext context,
      required FontTypeMainDrawer type,
      String? text}) {
    final translation = GetIt.I<TextTranslationConverter>();
    final appState = GetIt.I<AppStateProvider>();
    final sizeScreen = appState.getSizeHeight(context);

    switch (type) {
      case FontTypeMainDrawer.nameUser:
        return TextOutline(
            colorText: Colors.purple,
            colorBorder: Colors.black,
            text: text ?? '',
            textStyle: GoogleFonts.poppins(
              fontSize: appState.responsiveMobile(sizeScreen,
                  big: 14, fractionPixel: 0.01, small: 12),
              fontWeight: FontWeight.bold,
            ),
            blurRadius: 1,
            dx: 1,
            dy: 1);

      case FontTypeMainDrawer.addPartner:
        return TextOutline(
          colorText: Colors.purple,
          colorBorder: Colors.black,
          text:
              translation.stringsMainPageAndMainDrawer(context, 'addPartner') ??
                  '',
          textStyle: GoogleFonts.poppins(
            fontSize: appState.responsiveMobile(sizeScreen,
                big: 14,
                fractionPixel: 0.01,
                small: 12,
                defaultt: 14,
                medium: 14,
                superSmall: 12),
            fontWeight: FontWeight.bold,
          ),
          blurRadius: 1,
          dx: 1,
          dy: 1,
        );

      case FontTypeMainDrawer.exitAccount:
        return TextOutline(
          colorText: Colors.purple,
          colorBorder: Colors.black,
          text: translation.stringsMainPageAndMainDrawer(
                  context, 'exitAccount') ??
              '',
          textStyle: GoogleFonts.poppins(
            fontSize: appState.responsiveMobile(sizeScreen,
                big: 14,
                fractionPixel: 0.01,
                small: 12,
                defaultt: 14,
                medium: 14,
                superSmall: 12),
            fontWeight: FontWeight.bold,
          ),
          blurRadius: 1,
          dx: 1,
          dy: 1,
        );

      case FontTypeMainDrawer.userInfo:
        return TextOutline(
          colorText: Colors.purple,
          colorBorder: Colors.black,
          text: translation.stringsMainPageAndMainDrawer(context, 'userInfo') ??
              '',
          textStyle: GoogleFonts.poppins(
            fontSize: appState.responsiveMobile(sizeScreen,
                big: 14,
                fractionPixel: 0.01,
                small: 12,
                defaultt: 14,
                medium: 14,
                superSmall: 12),
            fontWeight: FontWeight.bold,
          ),
          blurRadius: 1,
          dx: 1,
          dy: 1,
        );

      case FontTypeMainDrawer.changeLanguage:
        return TextOutline(
          colorText: Colors.purple,
          colorBorder: Colors.black,
          text: translation.stringsMainPageAndMainDrawer(
                  context, 'changeLanguage') ??
              '',
          textStyle: GoogleFonts.poppins(
            fontSize: appState.responsiveMobile(sizeScreen,
                big: 14,
                fractionPixel: 0.01,
                small: 12,
                defaultt: 14,
                medium: 14,
                superSmall: 12),
            fontWeight: FontWeight.bold,
          ),
          blurRadius: 1,
          dx: 1,
          dy: 1,
        );
      case FontTypeMainDrawer.loginWithGoogle:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextOutline(
              colorText: Colors.amber,
              colorBorder: Colors.black,
              text: 'Login Com Google',
              textStyle: GoogleFonts.poppins(
                fontSize: appState.responsiveMobile(sizeScreen,
                    big: 14,
                    fractionPixel: 0.01,
                    small: 12,
                    defaultt: 14,
                    medium: 14,
                    superSmall: 12),
                fontWeight: FontWeight.bold,
              ),
              blurRadius: 12,
              dx: 1,
              dy: 1,
            ),
            Image.asset(
              'assets/images/icons/login_with_google_Icon.png',
              width: 50,
            ),
          ],
        );

      case FontTypeMainDrawer.smWhatsapp:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextOutline(
                colorText: Colors.amber,
                colorBorder: Colors.black,
                text: 'Nosso Canal no Whats',
                textStyle: GoogleFonts.poppins(
                  fontSize: appState.responsiveMobile(sizeScreen,
                      big: 14,
                      fractionPixel: 0.01,
                      small: 12,
                      defaultt: 14,
                      medium: 14,
                      superSmall: 12),
                  fontWeight: FontWeight.bold,
                ),
                blurRadius: 12,
                dx: 1,
                dy: 1,
              ),
            ),
            Image.asset(
              'assets/images/icons/whatsapp_icon.png',
              width: 50,
            ),
          ],
        );
      case FontTypeMainDrawer.smInstagram:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextOutline(
                colorText: Colors.amber,
                colorBorder: Colors.black,
                text: 'Instagram',
                textStyle: GoogleFonts.poppins(
                  fontSize: appState.responsiveMobile(sizeScreen,
                      big: 14,
                      fractionPixel: 0.01,
                      small: 12,
                      defaultt: 14,
                      medium: 14,
                      superSmall: 12),
                  fontWeight: FontWeight.bold,
                ),
                blurRadius: 12,
                dx: 1,
                dy: 1,
              ),
            ),
            Image.asset(
              'assets/images/icons/instagram_icon.png',
              width: 50,
            ),
          ],
        );
    }
  }

  static ({TextOutline? widget, TextStyle? style}) fontsLovetterForm(
      FontTypeLovetterForm fontType) {
    switch (fontType) {
      case FontTypeLovetterForm.addAudio:
        return (
          widget: null,
          style: GoogleFonts.poppins(
              color: Colors.purple, fontWeight: FontWeight.bold)
        );
    }
  }
}

