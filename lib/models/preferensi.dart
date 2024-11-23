import 'package:flutter/material.dart';

class PreferencesModel extends ChangeNotifier {
  bool _acak = false;
  bool _berulang = false;

  bool get acak => _acak;
  bool get berulang => _berulang;

  void toggleAcak() {
    _acak = !_acak;
    notifyListeners();
  }

  void toggleBerulang() {
    _berulang = !_berulang;
    notifyListeners();
  }
}
