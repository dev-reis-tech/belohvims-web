import 'package:belohvims_web/firebase_options.dart';
import 'package:belohvims_web/l10n/text_translation_converter.dart';
import 'package:belohvims_web/src/providers/app_state_provider.dart';
import 'package:belohvims_web/src/services/navigation_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



Future<void> setUpInjection() async {
  final getIt = GetIt.instance;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  // Inicializa e registra o ObjectBoxDB


  final appState = AppStateProvider();
  getIt.registerSingleton<AppStateProvider>(appState);

  // final userVars = VarsUserProvider();
  // getIt.registerSingleton<VarsUserProvider>(userVars);

  // final validate = ValidateProvider();
  // getIt.registerSingleton(validate);

  getIt.registerLazySingleton(() => NavigatorService());

  final textTranslationConverter = TextTranslationConverter();
  getIt.registerSingleton<TextTranslationConverter>(textTranslationConverter);



  // final lovetterDbImplDao = LovetterDBImplDAO();
  // getIt.registerSingleton(lovetterDbImplDao);

  // final lovetterSync = LovetterSyncService();
  // getIt.registerSingleton(lovetterSync);

  // final localeProvider = LocaleProvider();
  // getIt.registerSingleton<LocaleProvider>(localeProvider);

}
