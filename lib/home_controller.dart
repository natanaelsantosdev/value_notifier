import 'package:flutter/material.dart';

class HomeController {
  final ValueNotifier<List<String>> _names = ValueNotifier<List<String>>([]);
  ValueNotifier<List<String>> get names => _names;

  final nameController = TextEditingController();

  void addName({required String name}) {
    _names.value = List.from(_names.value)..add(name);
  }

  // void deleteName({required String name}) {
  //   names.remove(name);
  //   notifyListeners();
  // }

  void removeName({required String name}) {
    _names.value = List.from(_names.value)..remove(name);
  }
}
