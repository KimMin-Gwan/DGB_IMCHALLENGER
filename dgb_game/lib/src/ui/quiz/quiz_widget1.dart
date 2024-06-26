import 'package:dgb_game/src/ui/quiz/quiz_widget2.dart';
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
    if (queryHeight > maxHeight) {
      queryHeight = maxHeight;
    }
    return Scaffold(
      body: Container(
          width: queryWidth,
          height: queryHeight,
          color: _style.getMainColor(),
          child: Column(
            children: [
              mainBody(queryWidth, queryHeight),
              middleArea(queryWidth, queryHeight),
              bottomArea(queryWidth, queryHeight)
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
          child: Column(
            children: [
              Container(
                  alignment: Alignment.bottomCenter,
                  width: width,
                  height: height * 0.14,
                  color: _style.getBodyColor(),
                  child: Text('퀴즈 풀기', style: _style.getTitleTextStyle()),
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset('./images/money_dan.png', width: 170,height: 170,),
                width: width,
                height: height * 0.28,
                color: _style.getBodyColor(),
              ),
            ],
          )
        ),
      ],
    );
  }

  Widget middleArea(width, height){
    return Container(
      width: width,
      height: height * 0.23,
      color: _style.getMainColor(),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: width * 0.75,
            height: height * 0.05,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: width * 0.339,
                  height: 10,
                  child: Image.asset('./images/info.png'),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: width * 0.411,
                  child: Text("문제를 1개 맞추면 2pt를 받을 수 있어요.", style: _style.getInfoTextStyle()),
                ),
              ],
            )
          ),
          Container(
            width: width * 0.75,
            height: height * 0.14,
            decoration: BoxDecoration(
              color: _style.getBodyColor(),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: myQuiz(width, height),
          )
        ],
      ),
    );
  }
  //나의 퀴즈 현황
  Widget myQuiz(width, height){
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: width * 0.36,
          height: height * 0.1,
          child: Text("나의 퀴즈 현황"),
        ),
        Container(
            alignment: Alignment.center,
            width: width * 0.36,
            height: height * 0.1,
            child: Column(
                children: [
                  currentQuizNum(width, height, "1324 / 6000"),
                  currentQuizNum(width, height, "(2648pt / 12000pt)"),
                ]
            )
        ),
      ],
    );
  }
  //현재 정보(맞춘 문제, 경험치)
  Widget currentQuizNum(width, height, num_info){
    return Container(
      alignment: Alignment.center,
      height: height * 0.05,
      child: Text(num_info),
    );
  }


  Widget bottomArea(width, height){
    return Container(
      width: width,
      height: height * 0.27,
      color: _style.getBodyColor(),
      child: Column(
          children: [
            Container(
              child: bottom1(width, height),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.87,
                height: height * 0.087,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Text("뒤로가기", style: _style.getTopicTextStyle()),
              ),
            ),
          ],
      ),
    );
  }

  Widget bottom1(width, height){
    return Column(
      children: [
        infoDetail(width, height, "한 퀴즈 당 총 10개의 문제가 나옵니다."),
        InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuizWidget2())
            );
            },
          child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.87,
                      height: height * 0.087,
                      margin: EdgeInsets.only(left: 27),
                      decoration: BoxDecoration(
                        color: _style.getStartColor(),
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: Colors.black, width: 0.5),
                      ), 
                      child: Text("퀴즈 시작", style: _style.getTopicTextStyle()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 40,right: 8,top: 17,bottom: 17),
                            child: Image.asset('./images/heart.png', width: 28,height: 28,),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('-1'),

                          )
                        ]
                    )
                  ],
                ),
                Container(
                  width: width * 0.87,
                  height: 8,
                  color: _style.getBodyColor(),
                )
              ]
          )
        )
      ]
    );
  }

  Widget infoDetail(width, height, info){
    return Container(
      alignment: Alignment.bottomRight,
      width: width * 0.85,
      height: height * 0.05,
      child: Text(info),
    );
  }

}



