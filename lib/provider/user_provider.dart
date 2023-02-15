import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String did = '';
  String get getDID => did;

  setDID(String did) {
    this.did = did;
    notifyListeners();
  }
}