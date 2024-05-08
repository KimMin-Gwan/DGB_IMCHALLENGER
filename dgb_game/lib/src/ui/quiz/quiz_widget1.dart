import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/quiz_style.dart';

class QuizWidget1 extends StatefulWidget {
  const QuizWidget1({super.key});

  @override
  State<QuizWidget1> createState() => _QuizWidget1State();
}

class _QuizWidget1State extends State<QuizWidget1> {

  var _style = QuizTheme();// 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;

  @override
  Widget build(BuildContext context) {
    double queryWidth = MediaQuery .of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {
      queryWidth = maxWidth;
    }
    double queryHeight = MediaQuery .of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryWidth > maxHeight) {
      queryWidth = maxHeight;
    }
    return Scaffold(
      body: Container(
          width: queryWidth,
          height: queryHeight,
          color: _style.getMainColor(),
          child: Column(
            children: [
              mainBody(queryWidth, queryHeight),
              Container(),
              Container(),
            ],
          )
      )
    );
  }

  Widget mainBody(width, height){
    return Column(
      children: [
        Container(
          width: width,
          height: height * 0.5,
          color: _style.getRealWhite(),
        ),

      ],
    );
  }

}




