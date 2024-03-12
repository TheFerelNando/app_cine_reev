import 'package:app_cine_reev/screens/HomeScreen.dart';
import 'package:app_cine_reev/screens/SeatSelectionScreen.dart';
import 'package:flutter/material.dart';

class MyRouterDelegate extends RouterDelegate<String> with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentPath = '/';

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_currentPath == '/seat_selection') {
          return false;
        }

        _currentPath = '/';
        notifyListeners();
        return true;
      },
      pages: [
        MaterialPage(
          key: ValueKey('HomeScreen'),
          child: HomeScreen(),
        ),
        if (_currentPath == '/seat_layout') // Verifica si _currentPath es /seat_layout
          MaterialPage(
            key: ValueKey('SeatSelectionScreen'),
            child: SeatSelectionScreen(),
          ),
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(String path) async {
    _currentPath = path;
    notifyListeners(); // Notifica al listener luego de cambiar _currentPath
  }
}