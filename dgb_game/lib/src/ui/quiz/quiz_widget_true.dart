import 'package:dgb_game/src/ui/quiz/quiz_widget2.dart';
import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/quiz_style.dart';

class QuizTrue extends StatefulWidget {
  const QuizTrue({super.key});

  @override
  State<QuizTrue> createState() => _QuizTrueState();
}

class _QuizTrueState extends State<QuizTrue> {

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
      body: Stack(
        children: [
          const QuizWidget2(),
          Container(
            width: queryWidth,
            height: queryHeight,
            color: Colors.black26,
          ),
          SizedBox(
            width: queryWidth,
            height: queryHeight*0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: queryWidth,
                    height: queryHeight * 0.5,
                    child: Image.asset('./images/money_dan.png'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: queryWidth,
                    height: queryHeight * 0.1,
                    child: Text('틀렸어요!', style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w800),),
                  )
                ],
              )
            )
            ),
        ],
      ),
    );
  }

  Widget resultAnswer(width, height){
    return Column(
      children: [
        trueImage(width, height),
        Container(),
      ],
    );
  }

  Widget trueImage(width, height){
    return Container(
      width: width,
      height: height,
      color: Colors.black26,
      child: Image.asset('./images/money_dan.png'),);
  }
  Widget falseText(width, height){
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.1,
      child: Text('틀렸어요!', style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w800),),
    );
  }
}
