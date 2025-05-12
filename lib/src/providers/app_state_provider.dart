// import 'package:apointeli/src/models/models_build/users_model.dart';
// import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

enum SocialMedia { smInstagram, smWhatsapp }

class AppStateProvider with ChangeNotifier {
  // final String testValidade = '564.363.528-30';
  bool userExist = false;
  bool isUnlocked = false;

  double responsiveScrWidth(double width,
      {double? defaultt,
      double? smallPc,
      double? mediumPc,
      double? bigPc,
      double? superBigPc,
      double? big,
      double? medium,
      double? small,
      double? superSmall,
      double? fractionPixel}) {
    if (width > 1401) {
      double extraPixels = (width - 1001) * (fractionPixel ?? 0.1);
      return (superBigPc ?? 180) + extraPixels;
    }
    if (width >= 1001.9 && width <= 1400.9) {
      double extraPixels = (width - 1001) * (fractionPixel ?? 0.1);
      return (bigPc ?? 170) + extraPixels;
    }

    if (width >= 861.9 && width <= 1000.9) {
      double extraPixels = (width - 861) * (fractionPixel ?? 0.1);
      return (mediumPc ?? 150) + extraPixels;
    }

    if (width >= 600.9 && width <= 860.9) {
      double extraPixels = (width - 600) * (fractionPixel ?? 0.1);
      return (smallPc ?? 140) + extraPixels;
    }
    if (width >= 406.9 && width <= 460.9) {
      double extraPixels = (width - 380) * (fractionPixel ?? 0.1);
      return (big ?? 28) + extraPixels;
    }
    if (width >= 380.9 && width <= 405.9) {
      double extraPixels = (width - 380) * (fractionPixel ?? 0.1);
      return (medium ?? 24) + extraPixels;
    }
    if (width >= 340.9 && width <= 379.9) {
      double extraPixels = (width - 340) * (fractionPixel ?? 0.1);
      return (small ?? 20) + extraPixels;
    }
    if (width >= 280.9 && width <= 339.9) {
      double extraPixels = (width - 280) * (fractionPixel ?? 0.1);
      return (superSmall ?? 16) + extraPixels;
    }

    return defaultt ?? 18;
  }

  double responsiveMobile(double height,
      {double? defaultt,
      double? fullResolution,
      double? big,
      double? medium,
      double? small,
      double? superSmall,
      double? fractionPixel}) {
    if (height > 961) {
      //  double extraPixels = (height - 961) * (fractionPixel ?? 0.1);
      // return (big ?? 128) + extraPixels;
      return fullResolution ?? 20;
    }

    if (height >= 820 && height <= 960) {
      double extraPixels = (height - 820) * (fractionPixel ?? 0.1);
      print('Tela Grande $height');
      return (big ?? 22) + extraPixels;
    }
    if (height >= 760 && height <= 819) {
      double extraPixels = (height - 760) * (fractionPixel ?? 0.1);
      print('Tela média $height');
      return (medium ?? 20) + extraPixels;
    }
    if (height >= 680 && height <= 759) {
      double extraPixels = (height - 680) * (fractionPixel ?? 0.1);
      print('Tela Pequena $height');
      return (small ?? 18) + extraPixels;
    }
    if (height >= 520 && height <= 679) {
      double extraPixels = (height - 520) * (fractionPixel ?? 0.1);
      print('Tela extra pequena $height');
      return (superSmall ?? 18) + extraPixels;
    }
    return defaultt ?? 16;
  }

  double totalSquareNeters(double length, double height, double width) {
    final squareMeters = length * height * width;

    return double.parse(squareMeters.toStringAsFixed(2));
  }


void toggleIsUnlocked(){
  isUnlocked = !isUnlocked;
  notifyListeners();
}
  // String? getUserId() {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;

  //   if (user != null) {
  //     print('id usuário ${user.uid}');
  //     return user.uid;
  //   }

  //   return null;
  // }

  double getSizeWidth(BuildContext context, {double? percentSize}) {
    final width = MediaQuery.of(context).size.width;

    if (percentSize != null) {
      return width * percentSize;
    }

    return width;
  }

  double getSizeHeight(BuildContext context, {double? percentSize}) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.padding.top;
    final scrHeight = mediaQuery.size.height - statusBar;

    if (percentSize != null) {
      return scrHeight * percentSize;
    }

    return scrHeight;
  }

  String generateSecretCode(String uid) {
    // Gerar o hash MD5 do UID
    var bytes = utf8.encode(uid);
    var hash = md5.convert(bytes).toString();

    // Filtrar apenas os números do hash
    String numericHash = hash.replaceAll(RegExp(r'[^0-9]'), '');

    // Garantir que tenha ao menos 6 números
    while (numericHash.length < 6) {
      numericHash += '0'; // Adiciona zeros à direita, se necessário
    }

    // Retornar os 6 primeiros números
    return numericHash.substring(0, 6);
  }

  void showError(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }



  // Future<List<UsersModel>> fetchUsersFromDB() async {
  //   final db = await DBFlite.instance.database;
  //   final List<Map<String, dynamic>> usersMap =
  //       await db.query('users'); // Query na tabela "users"
  //   final List<Map<String, dynamic>> couplesMap =
  //       await db.query('CouplesDiary'); // Query na tabela "users"

  //   print("Users carregados do SQLite: $usersMap");
  //   print("Couples carregados do SQLite: $couplesMap");

  //   return usersMap.map((user) => UsersModel.fromJson(user)).toList();
  // }

  // Future<void> openExternalApp(String uriApp, String uriWeb) async {
  //   // 1) tenta abrir no app Instagram
  //   final uriAplication = Uri.parse(uriApp);
  //   if (await canLaunchUrl(uriAplication)) {
  //     await launchUrl(uriAplication);
  //     return;
  //   }
  //   // 2) fallback: abre no navegador
  //   final uriWebPage = Uri.parse(uriWeb);
  //   if (await canLaunchUrl(uriWebPage)) {
  //     await launchUrl(uriWebPage, mode: LaunchMode.externalApplication);
  //     return;
  //   }
  //   // 3) se nada funcionar
  //   throw 'Não foi possível abrir o app solicitado.';
  // }

  // Future<void> socialMediaUrl(SocialMedia sm) async {
  //   switch (sm) {
  //     case SocialMedia.smInstagram:
  //       return openExternalApp(
  //           'instagram://user?username=belohvims', 'https://instagram.com/belohvims');
  //     case SocialMedia.smWhatsapp:
  //       return openExternalApp(
  //           '', 'https://whatsapp.com/channel/0029Vb5PqwqA2pL82EtsSa24');
  //   }
  // }
}
