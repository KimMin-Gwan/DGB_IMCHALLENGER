import 'package:dgb_game/src/ui/home_widget.dart';
import 'package:dgb_game/src/ui/quiz/quiz_widget2.dart';
import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/quiz_style.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({super.key});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {

  var _style = QuizTheme();
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
            height: height * 0.48,
            color: _style.getRealWhite(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: width,
                  height: height * 0.14,
                  color: _style.getBodyColor(),
                  child: Text('퀴즈 결과', style: _style.getTitleTextStyle()),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('./images/dan_ddok.png', width: 170,height: 170,),
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
      height: height * 0.25,
      color: _style.getMainColor(),
      child: Column(
        children: [
          Container(
          width: width,
          height: height*0.128,
          color: _style.getMainColor(),
          child: myScore(width, height),
          ),
          Container(
            width: width,
            height: height*0.122,
            color: _style.getMainColor(),
            child: currentGrade(width, height),
          ),
          ]
      ),
    );
  }

  Widget myScore(width, height){
    return Column(
      children: [
        Container(
          width: width,
          height: height * 0.028,
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: width * 0.6,
                height: height,
                color: _style.getMainColor(),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: width * 0.1,
                      height: height,
                      color: _style.getMainColor(),
                      child: Image.asset('./images/info.png',width: 10,height: 10,),
                    ),
                    Container(
                      width: width * 0.2,
                      height: height,
                      color: _style.getMainColor(),
                      child: Text('문제 풀이'),
                    ),
                  ],
                )
              )
            ],
          ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 6),
          child: Container(
            margin: EdgeInsets.only(top: 1),
            width: width * 0.7,
            height: height * 0.09,
              decoration: BoxDecoration(
                color: _style.getBodyColor(),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.3,
                  child: Text('나의 점수'),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('8 / 10'),
                      ),
                      Container(
                        child: Text('exp'),
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        ),

      ],
    );
  }
  Widget currentGrade(width, height){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
        child: Container(
          margin: EdgeInsets.only(top: 1),
          width: width * 0.7,
          height: height * 0.09,
          decoration: BoxDecoration(
            color: _style.getBodyColor(),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: width * 0.3,
                child: Text('현재 등급'),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('Lv 11'),
                        ),
                        LinearPercentIndicator(
                          alignment: MainAxisAlignment.center,
                          width: width * 0.28,
                          lineHeight: height * 0.01,
                          percent: 0.9,
                          progressColor: _style.getPercentBarColor(),
                        ),
                      ],
                    ),
                  ],

                )


              ),
            ],
          ),
    ));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeWidget())
              );
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
              child: Text("홈으로", style: _style.getTopicTextStyle()),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottom1(width, height){
    return Column(
        children: [
          Container(
            width: width,
            height: height * 0.05,
            color: _style.getBodyColor(),
          ),
          InkWell(
              onTap: (){
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => QuizWidget2())
                // );
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
                          child: Text("다시 하기", style: _style.getTopicTextStyle()),
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
}