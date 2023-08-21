import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedScreen = 0;
  get selectedScreen => _selectedScreen;

  void switchScreen(int newValue) {
    _selectedScreen = newValue;
    notifyListeners();
  }
}
