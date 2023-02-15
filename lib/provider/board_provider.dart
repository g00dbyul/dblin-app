import 'package:flutter/material.dart';

import '../model/board.dart';

class BoardProvider with ChangeNotifier {
  List<Board> boards = [];
  List<Board> get getBoards => boards;

  setBoards(List<Board> boards) {
    this.boards = boards;
    notifyListeners();
  }
}