import 'package:dblin_app/screen/widget/bar_title.dart';
import 'package:dblin_app/screen/widget/main_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/board_provider.dart';
import '../repository/board_repository.dart';
import 'home_screen.dart';

class CongraturateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final boardProvider = Provider.of<BoardProvider>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BarTitle(),
              MainLogo(),
              Text('Dblin에 가입하신 것을 축하드립니다!~'),
              ElevatedButton(
                  onPressed: () async {
                    var boards = await getAllBoards();
                    print(boards);
                    if(boards.length != 0) {
                      boardProvider.setBoards(boards);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('계속하기')
              )
            ],
          ),
        ),
      )
    );
  }
}