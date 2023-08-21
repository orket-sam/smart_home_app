import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedScreen = 0;
  get selectedScreen => _selectedScreen;

  // Selected device when adding a new device

  int? _selectedDeviceIndex;

  get selectedDeviceIndex => _selectedDeviceIndex;

  void switchScreen(int newValue) {
    _selectedScreen = newValue;
    notifyListeners();
  }

  void setDeviceIndex(int deviceIndex) {
    _selectedDeviceIndex = deviceIndex;
    notifyListeners();
  }
}
