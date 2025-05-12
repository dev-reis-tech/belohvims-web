import 'package:belohvims_web/src/providers/app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  
  // Método estático para retornar o tema claro

  // Método estático para retornar o tema escuro (Dark Mode)
  static ThemeData darkPurpleTheme(BuildContext context) {
    final appSate = GetIt.I<AppStateProvider>();
    final sizeScreen = appSate.getSizeHeight(context);
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 4, 61),

      // Cor primária do aplicativo no modo escuro
      primaryColor: const Color.fromARGB(255, 50, 4, 61),
      // primaryColor: Color.fromARGB(255, 46, 50, 53),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromARGB(255, 94, 11,
              97), // cor primária de Preenchimento de box's (Containers, Cards,)
          onPrimary: Colors
              .amber, // Cor secuencia de Preenchimento de box's (Containers, Cards,)
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.amber,
          onSurface: Colors.amber), // Cor para textos e botões no modo escuro

          

      // AppBar no modo escuro

      appBarTheme: AppBarTheme(
        color: const Color.fromARGB(255, 35, 2, 43), // Cor da AppBar no modo escuro
        iconTheme:
            const IconThemeData(color: Colors.white), // Cor dos ícones da AppBar
        titleTextStyle: GoogleFonts.loveYaLikeASister(
            color: Colors.amber, fontSize: appSate.responsiveMobile(sizeScreen, small: 22, big: 28), fontWeight: FontWeight.w700),
        centerTitle: true,
        elevation: 12,
        shadowColor: const Color.fromARGB(255, 226, 190, 81),
      ),

      // Botões no modo escuro
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            // Cor de fundo do botão no modo escuro
            // Cor do texto e ícones no botão
            ),
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 50, 4, 61),
        scrimColor: Color.fromARGB(197, 6, 1, 7),
        shadowColor: Color.fromARGB(255, 199, 5, 102),
        elevation: 80,
      ),
      cardTheme: const CardThemeData(color: Colors.amber),
      // Campos de texto no modo escuro
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.tealAccent), // Cor da borda focada
        ),
        labelStyle: TextStyle(
          color: Colors.white,
          // Cor do texto do rótulo
        ),
        hintStyle: TextStyle(
          color: Colors.amber, // Cor do texto de dica
        ),
      ),

      // Cor dos textos no modo escuro

      // Cor dos botões de alternância (Switch, Checkbox, etc.) no modo escuro

      // Texto no modo escuro
      textTheme: const TextTheme(
        
      ),

      // Tema da BottomNavigationBar no modo escuro
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor:
            Color.fromARGB(255, 39, 0, 49), // Cor de fundo da BottomNavBar
        selectedItemColor: Colors.tealAccent, // Cor do item selecionado
        unselectedItemColor: Colors.white70, // Cor dos itens não selecionados
      ),

      
    );
  }
}
