import 'package:flutter/material.dart';

class NavigatorService {
  static final NavigatorService _instance = NavigatorService._internal();
  factory NavigatorService() => _instance;
  NavigatorService._internal();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String? currentRoute;

  void setCurrentRoute(String routeName) {
    currentRoute = routeName;
  }

  void reloadCurrentPage() {
    if (currentRoute != null) {
      navigatorKey.currentState?.pushReplacementNamed(currentRoute!);
    }
  }

  void pop() {
    return navigatorKey.currentState?.pop();
  }

  Future<Object?> pushReplacementNamed(String routeName,
      {Object? arguments}) async {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<Object?> pushNamed(String routeName, {Object? arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  /// Abre a [page] como rota empurrando um MaterialPageRoute.
  Future<T?> pushWidget<T extends Object?>(Widget page) {
    final nav = navigatorKey.currentState;
    if (nav != null) {
      return nav.push<T>(
        MaterialPageRoute(builder: (_) => page),
      );
    }
    // Se não tiver estado, devolve null imediatamente
    return Future.value(null);
  }

  /// Substitui a rota atual por [page].
  Future<T?> pushReplacementWidget<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    final nav = navigatorKey.currentState;
    if (nav != null) {
      return nav.pushReplacement<T, TO>(
        MaterialPageRoute(builder: (_) => page),
        result: result,
      );
    }
    return Future.value(null);
  }
}
