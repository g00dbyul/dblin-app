import 'package:flutter/material.dart';

class TabLabel extends StatelessWidget {
  String title;
  Function callback;

  TabLabel({required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          callback;
        },
        child: Text(title)
    );
  }
}