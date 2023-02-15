import 'package:dblin_app/constants/category.dart';
import 'package:dblin_app/repository/board_repository.dart';
import 'package:dblin_app/screen/widget/bar_title.dart';
import 'package:dblin_app/screen/widget/main_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/board_provider.dart';
import 'home_screen.dart';

class WriteBoardScreen extends StatefulWidget {
  @override
  State<WriteBoardScreen> createState() => WriteBoardScreenState();
}

class WriteBoardScreenState extends State<WriteBoardScreen> {
  String? selected;
  final titleFieldController = TextEditingController();
  final contentFieldController = TextEditingController();

  Widget categoryDropdown() {
    return DropdownButton(
      hint: Text('카테고리를 선택해 주세요.'),
      value: selected,
      items: categoryList
          .map((e) => DropdownMenuItem(
        child: Text(e),
        value: e,
      )).toList(),
      onChanged: (value) {
        setState(() {
          selected = value!;
          print(selected);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final boardProvider = Provider.of<BoardProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  BarTitle(),
                  Divider(),
                ],
              ),
              Column(
                children: [
                  categoryDropdown(),
                  TextField(
                      controller: titleFieldController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '제목',
                      )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20)),
              TextField(
                controller: contentFieldController,
                minLines: 1,
                maxLines: 1000,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: '내용'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var result = await createBoard(selected.toString(), 'did', titleFieldController.text, contentFieldController.text);
                    var boards = await getAllBoards();
                    if(boards.length != 0) {
                      boardProvider.setBoards(boards);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('등록하기')
              )
            ],
          ),
        ),
      )
    );
  }
}