import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final List<String> _names = [];
  List<String> get names => _names;

  void addName({required String name}) {
    names.add(name);
    notifyListeners();
  }
}
