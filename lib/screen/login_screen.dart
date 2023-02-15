import 'package:dblin_app/screen/widget/bar_title.dart';
import 'package:dblin_app/screen/widget/kakao_login_button.dart';
import 'package:dblin_app/screen/widget/main_logo.dart';
import 'package:dblin_app/service/logout.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
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
              Column(
                children: [
                  KakaoLoginButton(),
                  Divider(),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: screenSize.width * 0.6,
                child: Text(
                    '카카오로그인으로 쉽게 회원가입하고, 쉽게 로그인 할 수 있어요',
                    style: TextStyle(color: Colors.grey),
                    maxLines: 2,
                    textAlign: TextAlign.center
                ),
              )
            ],
          )
        )
      ),
    );
  }
}