import 'package:dblin_app/repository/board_repository.dart';
import 'package:dblin_app/screen/home_screen.dart';
import 'package:dblin_app/service/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/board_provider.dart';
import '../congraturate_screen.dart';

class KakaoLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boardProvider = Provider.of<BoardProvider>(context);
    final Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Image.asset('assets/kakao_login.png', width: screenSize.width * 0.8),
      ),
      onTap: () async {
        var loginResult = await login();
        if(loginResult == null) {
          var boards = await getAllBoards();
          print(boards);
          if(boards.length != 0) {
            boardProvider.setBoards(boards);
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CongraturateScreen()));
        }
      },
    );
  }
}