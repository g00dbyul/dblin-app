import 'package:dblin_app/model/board.dart';
import 'package:dblin_app/screen/widget/bar_title.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  Board board;

  BoardScreen({ required this.board });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BarTitle(),
                Text(board.category, style: TextStyle(color: Colors.grey)),
                Container(
                  width: screenSize.width * 0.8,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.pink.shade100
                    ),
                  ),
                  child: Text(board.title, style: TextStyle(fontSize: 20, color: Colors.grey)),
                ),
                Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.65,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.pink.shade100
                    ),
                  ),
                  child: Text(board.content,  style: TextStyle(color: Colors.grey)),
                )
              ],
            )
          )
        )
      ),
    );
  }
}