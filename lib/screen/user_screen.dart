import 'package:dblin_app/screen/login_screen.dart';
import 'package:dblin_app/screen/widget/bar_title.dart';
import 'package:flutter/material.dart';

import '../service/logout.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BarTitle(),
              ElevatedButton(
                  onPressed: () async {
                    await logout();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text('Logout')
              )
            ],
          ),
        )
      ),
    );
  }
}