import 'package:flutter/material.dart';

class HomeController {
  final ValueNotifier<List<String>> _names = ValueNotifier<List<String>>([]);
  ValueNotifier<List<String>> get names => _names;

  final nameController = TextEditingController();

  ValueNotifier<bool> botaoAdd = ValueNotifier(false);

  HomeController() {
    nameController.addListener(() {
      botaoAdd.value = nameController.value.text.isNotEmpty;
    });
  }

  void addName({required String name}) {
    _names.value = List.from(_names.value)..add(name);
  }

  void removeName({required String name}) {
    _names.value = List.from(_names.value)..remove(name);
  }
}
