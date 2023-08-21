import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  // Slider values
  double _lightValue = 0.123;
  double _lampValue = 0.913;
  get lightValue => _lightValue;
  get lampValue => _lampValue;

// Tweak slider values
  void tweakSliderValues(String key, double newVal) {
    switch (key) {
      case 'light':
        _lightValue = newVal;
      case 'lamp':
        _lampValue = newVal;
        break;
      default:
        {
          throw 'Invalid key';
        }
    }
    notifyListeners();
  }

  // Switch values
  bool _humidifierValue = true;
  bool _airPurifierValue = true;

  get humidifierVal => _humidifierValue;
  get airPurifierVal => _airPurifierValue;

  // tweak switch values

  void tweakSwitchValues(String key, bool newVal) {
    switch (key) {
      case 'humidity':
        _humidifierValue = newVal;
      case 'air':
        _airPurifierValue = newVal;
        break;
      default:
        {
          throw 'Invalid key';
        }
    }
    notifyListeners();
  }
}
