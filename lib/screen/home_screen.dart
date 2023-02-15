import 'package:dblin_app/screen/board_screen.dart';
import 'package:dblin_app/screen/user_screen.dart';
import 'package:dblin_app/screen/widget/bar_title.dart';
import 'package:dblin_app/screen/widget/bottom.dart';
import 'package:dblin_app/screen/widget/tab_label.dart';
import 'package:dblin_app/screen/write_board_screen.dart';
import 'package:dblin_app/view_model/board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/category.dart';
import '../model/board.dart';
import '../provider/board_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Widget header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WriteBoardScreen()));
                },
                icon: Icon(Icons.edit, color: Colors.pinkAccent)
            ),
            BarTitle(),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
                },
                icon: Icon(Icons.person, color: Colors.pinkAccent)
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget category() {
    List<Widget> categoryLabels = categoryList.map((category) {
      return TabLabel(title: category, callback: () {});
    }).toList();
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categoryLabels,
        ),
      ),
    );
  }

  boardListView() {
    final boardProvider = Provider.of<BoardProvider>(context);
    if(boardProvider.getBoards.length == 0) {
      return Center(
        child: Container(
          width: 200,
          height: 200,
          child: Text('게시글이 존재하지 않습니다. 게시판의 첫 게시자가 되어주세요'),
        )
      );
    } else {
      return Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: boardProvider.getBoards.length,
              itemBuilder: (BuildContext context, int index) {
                BoardViewModel viewModel = Board.toViewModel(boardProvider.getBoards[index]);
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BoardScreen(board: boardProvider.getBoards[index])));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Colors.pink.shade100
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(viewModel.title, style: TextStyle(color: Colors.grey, fontSize: 20)),
                        ),
                        Text(viewModel.updatedAt, style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  )
                );
              }
          )
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  header(),
                  category(),
                  boardListView(),
                  Bottom()
                ],
              ),
            ),
          )
        )
    );
  }
}
