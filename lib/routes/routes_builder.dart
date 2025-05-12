import 'package:belohvims_web/letters/lovetter/pages/lovetter_share_screen.dart';
import 'package:belohvims_web/letters/utils/letters_routes_web.dart';
import 'package:belohvims_web/routes/core_routes_web.dart';
import 'package:belohvims_web/src/page/main_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  CoreRoutesWeb.mainPage: (ctx) => MainPage(),
  LettersRoutesWeb.lovetterShareScreen: (ctx) => LovetterShareScreen(token: '')
};
