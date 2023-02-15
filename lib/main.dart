import 'package:dblin_app/provider/board_provider.dart';
import 'package:dblin_app/provider/user_provider.dart';
import 'package:dblin_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:provider/provider.dart';

void main() {
  KakaoSdk.init(
    nativeAppKey: '8b59ced9043bbe6e2023d3a2ae24aa7e',
  );
  runApp(const DblinApp());
}

class DblinApp extends StatelessWidget {
  const DblinApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BoardProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          home: LoginScreen()
      )
    );
  }
}

