import 'package:dblin_app/provider/board_provider.dart';
import 'package:dblin_app/provider/user_provider.dart';
import 'package:dblin_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  print(dotenv.env['KAKAO_SDK_KEY']);
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_SDK_KEY'],
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

