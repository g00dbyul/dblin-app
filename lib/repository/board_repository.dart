import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/board.dart';

var client = http.Client();

getBoardsByCategory(String category) async {
  try {
    var response = await client.get(Uri.http('localhost:3000','boards/', { 'category':category }));
    var toJson = convert.jsonDecode(response.body);
    if(toJson['result'] == 'NotFound') {
      return [];
    } else {
      return toJson['result'].map((item) => Board.fromJson(item)).toList();
    }
  } catch(e) {
    return [];
  }
}

Future<List<Board>> getAllBoards() async {
  try{
    var response = await client.get(Uri.http('localhost:3000','boards/'));
    var toJson = convert.jsonDecode(response.body);
    if(toJson['result'] == 'NotFound') {
      return [];
    } else {
      return toJson['result'].map<Board>((item) => Board.fromJson(item)).toList();
    }
  } catch(e) {
    print(e);
    return [];
  }
}

Future<Board> createBoard(String category, String userDID, String title, String content) async {
  var response = await client.post(Uri.http('localhost:3000','boards/'), body: { 'category': category, 'userDID': userDID, 'title': title, 'content': content });
  dynamic toJson = convert.jsonDecode(response.body);
  print(toJson);
  return Board.fromJson(toJson['result']);
}