import 'dart:html';

import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/home_style.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 이거는 건들이지 말고
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

// 이걸 만들어야 됨
class _HomeWidgetState extends State<HomeWidget> {

  var _style = HomeScaffoldTheme();  // 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;

  @override
  Widget build(BuildContext context) {
    // 화면의 가로 세로 길이를 받아오기
    double queryWidth = MediaQuery.of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {queryWidth = maxWidth;}
    double queryHeight = MediaQuery.of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryHeight> maxHeight) {queryHeight= maxHeight; }

    // 본문 위젯
    return Scaffold(
      body: HomeBodyWidget(),
    );
  }
}

class HomeBodyWidget extends StatefulWidget {
  @override
  _HomeBodyWidgetState createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget>{
  var _style = HomeScaffoldTheme();  // 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;
  @override
  Widget build(BuildContext context) {
    double queryWidth = MediaQuery.of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {queryWidth = maxWidth;}
    double queryHeight = MediaQuery.of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryHeight> maxHeight) {queryHeight= maxHeight; }
    return Container(  // 이 녀석은 배경 밑에 있는 도화지 같은 녀석
      color: _style.getMainWhite(),
      width:  queryWidth,
      height: queryHeight,
      alignment: Alignment.center, // 정렬
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('./background.jpg'),
                fit:BoxFit.cover,
              )
            ),
          ),
          Column(  // 이제 진짜로 그릴꺼
            children:[
              topButtonWidget(queryWidth, queryHeight),
              topBodyWidget(queryWidth, queryHeight), //길어져서 뜯어버림
              mainTable(queryWidth, queryHeight),
              bottomWidget(queryWidth, queryHeight),
            ]
          )
        ]
      )
    );
  }


  //---------------------------------------------------------
  // 최상단 버튼
  Widget topButtonWidget(width, height){
    return Container( //최상단
        alignment: Alignment.centerRight,
        width: width,
        height: height * 0.07,
        //color: Colors.redAccent,
        child: Container( // 최상단 좌측
            width: width * 0.4,
            height: height * 0.07,
            //color: Colors.green,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  eventButton(width*0.3, height * 0.07),
                  questButton(width*0.3, height * 0.07),
                  settingButton(width*0.3, height * 0.07),
                ]
            )
        )
    );
  }

  Widget settingButton(width, height,) {
    return Container(
        margin: EdgeInsets.only(left: 2, right: 2),
        alignment: Alignment.center,
        width: width * 0.36,
        height: width * 0.36,
        //color: Colors.blue,
        child:IconButton(
          icon: FaIcon(FontAwesomeIcons.cog, color: _style.getRealWhite(),),
          iconSize: width * 0.18,
          style: IconButton.styleFrom(
            backgroundColor: _style.getSettingColor(),
            shadowColor: Colors.black,
          ),
          onPressed: (){},
        )
    );
  }

  Widget questButton(width, height,) {
    return Container(
        margin: EdgeInsets.only(left: 2, right: 2),
        alignment: Alignment.center,
        width: width * 0.36,
        height: width * 0.36,
        //color: Colors.blue,
        child:IconButton(
          icon: FaIcon(FontAwesomeIcons.trophy, color: _style.getRealWhite(),),
          iconSize: width * 0.18,
          style: IconButton.styleFrom(
            backgroundColor: _style.getQuestColor(),
            shadowColor: Colors.black,
          ),
          onPressed: (){},
        )
    );
  }

  Widget eventButton(width, height,) {
    return Container(
        margin: EdgeInsets.only(left: 2, right: 2),
        alignment: Alignment.center,
        width: width * 0.36,
        height: width * 0.36,
        //color: Colors.blue,
        child:IconButton(
          icon: FaIcon(FontAwesomeIcons.solidStar, color: _style.getRealWhite()),
          iconSize: width * 0.18,
          style: IconButton.styleFrom(
            backgroundColor: _style.getEventColor(),
            shadowColor: Colors.black,
          ),
          onPressed: (){},
        )
    );
  }

  // --------------------------------------------------------------------------------
  // 상단
  Widget topBodyWidget(width, height){
    return Container( //상단
      alignment: Alignment.centerLeft,
      height: height * 0.1,  //전체 새로 길이중 10%
      width: width,
      //color: Colors.blue,
      child: Container( // 레벨 및 경험치 박스
        margin: EdgeInsets.only(left: 15, top: 2, bottom: 2),
        decoration: _style.getContainerDecoration(),
        width: width * 0.42,
        height: height * 0.07,
        // 레벨 데이터를 넣어야되는 데 일단은 그냥 상수값 때려박음
        child : levelWidget(width*0.42, height*0.07)
      )
    );
  }

  // 레벨 과 진행바
  Widget levelWidget(width, height){
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin:  EdgeInsets.only(left: 20),
          height: height * 0.7,
          child: Text('Lv. 11', style: _style.getlevelTextStyle()),
        ),
        Container(
          alignment:Alignment.centerLeft,
          height: height * 0.3,
          width: width,
          margin: EdgeInsets.only(left:10),
          child: LinearPercentIndicator(
            width: width * 0.9,
            lineHeight: height * 0.05,
            percent: 0.9,
            progressColor: _style.getPercentBarColor(),
          )
        )
      ]
    );
  }

  // 중단
  Widget mainTable(width, height){
    return Container(
      height: height * 0.7,  //전체 새로 길이중 60%
      width: width,
      //color: Colors.green,
      // child : Container() // 단디가 등장할 부분을 그려야됨
    );
  }


  Widget bottomWidget(width, height){
    return Container( //하단
      height: height * 0.1,  //전체 새로 길이중 20%
      width: width,
      child: Row(
        children: [
          Container(
            width: width * 0.6,
            height : height * 0.08,
            child: Column(
              children: [
                autoExpTable(width, height),
                heartTable(width, height)
              ],
            )
          ),
          quizButton(width, height),
        ]
      )
    );
  }

  Widget quizButton(width, height){
    return SizedBox(
      width: width * 0.3,
      height: height * 0.08,
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _style.getWidgetBoxGrayColor(),
        ),
        child: Container(
          width: width * 0.2,
          height: height * 0.05,
          child:Text("QUIZ", style: _style.getlevelTextStyle()),
        ),
        onPressed: (){},
      )
    );
  }

  Widget heartTable(width, height){
    width = width * 0.5;

    return Container(
      margin: EdgeInsets.all(3),
      width: width,
      height: height * 0.03,
        child: Row(
            children: [
              Container( // 하트 들어가는 곳
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(3),
                width: width * 0.60,
                height: height * 0.03,
                decoration: _style.getContainerDecoration(),
                child: Row(
                  children:[
                    Image.asset('./heart.png')
                  ]
                )
              ),
              Container(  // 쿨타임
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(3),
                width: width * 0.34,
                height: height * 0.03,
                decoration: _style.getContainerDecoration(),
                child: Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text(" + 122", style: _style.getAutoExpHourTextStyle(),)
                )
              ),
            ]
        )
    );
  }

  Widget autoExpTable(width, height){
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(3),
      width: width * 0.5,
      height: height * 0.03,
      decoration: _style.getContainerDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(" + 1.04", style: _style.getAutoExpTextStyle()),
          Text("          / hour", style: _style.getAutoExpHourTextStyle(),)
        ]
      )
    );
  }


}

