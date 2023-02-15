import '../view_model/board_view_model.dart';

class Board {
  String uuid;
  String category;
  String title;
  String content;
  String userDID;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Board({
    required this.uuid,
    required this.category,
    required this.title,
    required this.content,
    required this.userDID,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  static BoardViewModel toViewModel(Board board) {
    return BoardViewModel(title: board.title, content: board.content, updatedAt: board.updatedAt);
  }

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(uuid: json['uuid'], category: json['category'], title: json['title'], userDID: json['userDID'],
        content: json['content'], createdAt: json['createdAt'], updatedAt: json['updatedAt'], deletedAt: json['updatedAt']);
  }
}