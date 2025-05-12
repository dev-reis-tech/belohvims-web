// web/share.dart

import 'package:belohvims_web/injection.dart';
import 'package:belohvims_web/letters/lovetter/pages/lovetter_share_screen.dart';
import 'package:belohvims_web/routes/routes_builder.dart';
import 'package:belohvims_web/src/page/main_page.dart';
import 'package:belohvims_web/src/providers/app_state_provider.dart';

import 'package:belohvims_web/src/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  await setUpInjection();
  setPathUrlStrategy();
  runApp(const BelohvimsWeb());
}

class BelohvimsWeb extends StatelessWidget {
  const BelohvimsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    // Pega o path atual da barra, ex: "/", "/main-page", "/abcdef123"
    final path = Uri.base.path;

    return MultiProvider
    (providers: [
      ChangeNotifierProvider(create: (_) => AppStateProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Be Lohvim's Web",
        theme: AppTheme.darkPurpleTheme(context),
      
        // Se o path for "/" ou vazio, usa "/main-page", senão usa exatamente o segmento
        initialRoute: (path == '/' || path.isEmpty) ? '/main-page' : path,
      
        // Rotas estáticas (main-page, outras páginas que você já definiu)
        routes: routes,
      
        // Roteamento dinâmico para um único segmento que não bate em `routes`
        onGenerateRoute: (settings) {
          final uri = Uri.parse(settings.name!);
      
          // 1) raiz ou /main-page
          if (uri.path == '/' || uri.path == '/main-page') {
            return MaterialPageRoute(builder: (_) => const MainPage());
          }
      
          // 2) se você quiser tratar alguma rota estática extra, faça aqui...
          //    ex: if (uri.path == '/alguma-outra') { ... }
      
          // 3) rota dinâmica de token: um único segmento qualquer
          final segments = uri.pathSegments;
          if (segments.length == 1) {
            final token = segments.first;
            return MaterialPageRoute(
              builder: (_) => LovetterShareScreen(token: token),
              settings: settings,
            );
          }
      
          // 4) fallback padrão
          return MaterialPageRoute(builder: (_) => const MainPage());
        },
      ),
    );
  }
}
