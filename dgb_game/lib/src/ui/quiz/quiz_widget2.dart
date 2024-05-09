import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/quiz_style.dart';

class QuizWidget2 extends StatefulWidget {
  const QuizWidget2({super.key});

  @override
  State<QuizWidget2> createState() => _QuizWidget2State();
}

class _QuizWidget2State extends State<QuizWidget2> {

  var _style = QuizTheme();// 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;
  bool _buttonColor = false;

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
            topPart(queryWidth,queryHeight),
            middlePart(queryWidth,queryHeight),
            bottomPart(queryWidth,queryHeight),
          ],
        )
      )
    );
  }

  Widget topPart(width, height){
    return Container(
      width: width,
      height: height * 0.4,
      color: _style.getMainColor(),
      child: Column(
        children: [
        numQuest(width, height),
        question(width, height, '한 가지 자산에 몰아서 투자하지 않고 여러 자산에 분산 투자하는 가장 주된 목적은?'),
      ]
      ),
    );
  }
  Widget numQuest(width, height){
    return Container(
      width: width,
      height: height * 0.2,
      color: _style.getMainColor(),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('./think.png'),
            width: 35,
            height: height * 0.15,

          ),
          Container(
              alignment: Alignment.topCenter,
              width: width * 0.5,
              height: height * 0.05,
              child: Text('1/10')
          ),
        ],
      ),
    );
  }

  Widget question(width, height, quest){
    return Container(
      alignment: Alignment.center,
      width: width * 0.8,
      height: height * 0.2,
      child: Text(quest, style: _style.getQuestTextStyle()),
    );
  }

  Widget middlePart(width, height){
    return Container(
      width: width,
      height: height * 0.5,
      color: _style.getMainColor(),
      child: Column(
        children: [
          selectBox(width, height, '복리 효과'),
          selectedBox(width, height, '과세 이연'),
          selectBox(width, height, '절세 효과'),
          selectBox(width, height, '위험 회피'),
        ],
      )
    );
  }
  Widget selectBox(width, height, example){
    return InkWell(
        onTap: (){
          print("버튼눌림");
          print(_buttonColor);
          setState(() {
            _buttonColor = true;
          });
          },
    child: Column(
      children: [
        Container(
            alignment: Alignment.center,
            width: width * 0.96,
            height: height * 0.10,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(example, style: _style.getExampleTextStyle())
        ),
        Container(
          width: width,
          height: 10,
          color: _style.getMainColor(),
        ),
      ],
    )
    );
  }

  //선택된 버튼
  Widget selectedBox(width, height, example){
    return InkWell(
        onTap: (){
          print("버튼눌림");
          print(_buttonColor);
          setState(() {
            _buttonColor = true;
          });
        },
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                width: width * 0.96,
                height: height * 0.11,
                decoration: BoxDecoration(
                  color: _buttonColor ? Color(0xff038AE4) : Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(example, style: _style.getExampleTextStyle())
            ),
            Container(
              width: width,
              height: 10,
              color: _style.getMainColor(),
            ),
          ],
        )
    );
  }


  Widget bottomPart(width, height){
    return Container(
      width: width,
      height: height * 0.1,
      color: _style.getMainColor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          jump(width, height),
          decision(width, height),
        ],
      ),
    );
  }
  Widget jump(width, height){
    return Container(
      alignment: Alignment.center,
      width: width * 0.45,
      height: height,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('건너뛰기', style: _style.getQuestTextStyle()),
    );
  }
  Widget decision(width, height){
    return Container(
        alignment: Alignment.center,
        width: width * 0.45,
        height: height,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
      child: Text('결정', style: _style.getQuestTextStyle())
    );
  }




}
