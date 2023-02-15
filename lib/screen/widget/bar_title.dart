import 'package:flutter/material.dart';

class BarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
          'Dblin',
          style: TextStyle(color: Colors.grey, fontSize: 30),
          textAlign: TextAlign.center
      ),
    );
  }
}