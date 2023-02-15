import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Divider(),
        Text('copyrightⓒ 2023 All rights reserved by @G00dbyul', style: TextStyle(color: Colors.grey))
      ],
    );
  }
}