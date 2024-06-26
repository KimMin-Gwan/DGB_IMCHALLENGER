import 'package:flutter/material.dart';  // 기본 패키지
import 'package:dgb_game/src/ui/home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xfff7faff),
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),

      home: HomeWidget() // 메인 화면 실행문
    );
  }
}
