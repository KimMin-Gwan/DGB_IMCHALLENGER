// 리미시가 작업해야하는 파일
// 피그마를 보고 화면에 나올 위젯을 그대로 그리면됨
// 색깔, 폰트 등등 설정은 전부다 _style에 적을것
// _style에 적는다는 말은 SettingTheme class에 적을것 (home_style.dart 참고)
// 테스트를 진행할 때 main.dart에 home: 부분을 변경할 것 (본인것으로)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/setting_style.dart';
import 'package:flutter/widgets.dart';


// 이녀석은 건들이지 말고
class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

// 이녀석을 만들어야됨 여기부터 아래 작성하면됨
// 모르겠으면 home_widget.dart 참고할것
class _SettingWidgetState extends State<SettingWidget> {

  var _style = SettingTheme(); // 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;


  // 핵심 실행 함수 : build()
  @override
  Widget build(BuildContext context) {
    // 화면의 가로 세로 길이를 받아오기
    double queryWidth = MediaQuery
        .of(context)
        .size
        .width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {
      queryWidth = maxWidth;
    }
    double queryHeight = MediaQuery
        .of(context)
        .size
        .height;
    // 세로 최대 길이를 1200으로  한정
    if (queryHeight > maxHeight) {
      queryHeight = maxHeight;
    }

    return Scaffold(
      body: SettingBodyWidget(),
    );
  }
}
class SettingBodyWidget extends StatefulWidget {
  @override
  _SettingBodyWidgetState createState() => _SettingBodyWidgetState();
}

class _SettingBodyWidgetState extends State<SettingBodyWidget> {
  var _style = SettingTheme(); // 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;


  @override
  Widget build(BuildContext context) {
    double queryWidth = MediaQuery
        .of(context)
        .size
        .width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {
      queryWidth = maxWidth;
    }
    double queryHeight = MediaQuery
        .of(context)
        .size
        .height;
    // 세로 최대 길이를 1200으로  한정
    if (queryWidth > maxHeight) {
      queryWidth = maxHeight;
    }
    return Container(   //배경 밑 도화지 (기본배경)
      color: _style.getMainWhite(),
      width: queryWidth,
      height: queryHeight,
      child: Column(
        children: [
          Header(queryWidth, queryHeight),
          Title(queryWidth, queryHeight),
          ChangeTheme(queryWidth, queryHeight),
          Alarm(queryWidth, queryHeight),
          Helper(queryWidth, queryHeight),
          Etc(queryWidth, queryHeight)

        ],
      )
    );
  }

  //최상단(뒤로가기 있는 곳)
  Widget Header(width, height) {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      width: width,
      height: height * 0.1,
      color: Color(0xffE1F2FC),
    );
  }

  //어떤 페이지인지(설정페이지)
  Widget Title(width, height) {
    return Container(
      width: width,
      height: height * 0.20,
      color: Color(0xffF7FAFF),
      child: Column( // Row 위젯을 사용해 가로로 배치
        children: [
          SizedBox(height: 12.0), // Header와 Title 사이에 공간 추가
          Title_inner_row(width, height),
        ],
      ),
    );
  }
  //테마 변경
  Widget ChangeTheme(width, height){
    return InkWell(
      onTap: (){
        print("버튼 눌림");
      },
      child: Column(
        children: [
          Container(
              width: width,
              height: height*0.1,
              color: Color(0xFFD1ECFF),
              child: Row(
                children: [
                  TopicEmage(width, height),
                  TopicTitle(width, height),
                  ThemePlus(width, height),
                ],
              )
          ),
          Container(
            width: width,
            height: 10,
            color: Color(0xffEFF6FE),
          ),
        ],
      )
    );
  }

  //알림
  Widget Alarm(width, height){
    return Column(
      children: [
        Container(
            width: width,
            height: height*0.1,
            color: Color(0xFFD1ECFF),
            child: Row(
              children: [
                AlarmEmage(width, height),
                AlarmTitle(width, height),
              ],
            )
        ),
        Container(
          width: width,
          height: 10,
          color: Color(0xffEFF6FE),
        ),
      ],
    );
  }
  //도움말
  Widget Helper(width, height){
    return Column(
      children: [
        Container(
            width: width,
            height: height*0.1,
            color: Color(0xFFD1ECFF),
            child: Row(
              children: [
                HelperEmage(width, height),
                HelperTitle(width, height),
              ],
            )
        ),
        Container(
          width: width,
          height: 10,
          color: Color(0xffEFF6FE),
        ),
      ],
    );
  }
  //기타
  Widget Etc(width, height){
    return Column(
      children: [
        Container(
            width: width,
            height: height*0.1,
            color: Color(0xFFD1ECFF),
            child: Row(
              children: [
                EtcEmage(width, height),
                EtcTitle(width, height),
              ],
            )
        ),
        Container(
          width: width,
          height: 10,
          color: Color(0xffEFF6FE),
        ),
      ],
    );
  }


  Widget TopicEmage(width, height){
    return Container(
      alignment: Alignment.center,
      child: Image.asset('./theme.png',width: 30,height: 30),
      width: width * 0.15,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }
  Widget TopicTitle(width,height){
    return Container(
      alignment: Alignment.centerLeft, 
      child: Text('테마 변경',style:_style.getTopicTextStyle()),
      width: width * 0.65,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }
  Widget AlarmEmage(width, height){
    return Container(
      alignment: Alignment.center,
      child: Image.asset('./notification.png',width: 30,height: 30),
      width: width * 0.15,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }
  Widget AlarmTitle(width,height){
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('알림',style:_style.getTopicTextStyle()),
      width: width * 0.65,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }
  Widget HelperEmage(width, height){
    return Container(
      alignment: Alignment.center,
      child: Image.asset('./question.png',width: 30,height: 30),
      width: width * 0.15,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }
  Widget HelperTitle(width,height){
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('도움말',style:_style.getTopicTextStyle()),
      width: width * 0.65,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }
  Widget EtcEmage(width, height){
    return Container(
      alignment: Alignment.center,
      child: Image.asset('./etc.png',width: 30,height: 30),
      width: width * 0.15,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }
  Widget EtcTitle(width,height){
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('기타',style:_style.getTopicTextStyle()),
      width: width * 0.65,
      height: height,
      color: Color(0xFFD1ECFF),
    );
  }



  Widget ThemePlus(width, height){
    return Container(
      width: width * 0.2,
      height: height,
      color: Color(0xFFD1ECFF),
      child: Icon(Icons.chevron_right),
    );
  }

// #############################################################################
// Title 함수
  Widget Title_inner_row(width, height) {
    return Container(
        child: Row(
          children: [
            Title_image(width, height),
            Title_text(width, height)
          ],
        )
    );
  }

  Widget Title_text(width, height) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text("  설정", style: _style.getTitleTextStyle()),
      );
  }

  Widget Title_image(width, height) {
    return Padding( // 여기에 Padding 위젯을 추가합니다.
      padding: EdgeInsets.only(left: 15.0), // 왼쪽에 10.0의 패딩을 추가합니다.
      child: Image.asset('assets/setting.png', width: 40, height: 40),
    );
  }

}