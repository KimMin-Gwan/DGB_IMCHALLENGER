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

  var _style = SettingTheme();  // 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;


  // 핵심 실행 함수 : build()
  @override
  Widget build(BuildContext context) {
    // 화면의 가로 세로 길이를 받아오기
    double queryWidth = MediaQuery.of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {queryWidth = maxWidth;}
    double queryHeight = MediaQuery.of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryHeight > maxHeight) {queryHeight = maxHeight; }

    // 가장 큰 틀!!!!!!!!!
    return Scaffold(
        body: Container(
            color: Color(0xFFEFF6FE),  // 배경 색깔 지정 getMainWhite()
            width: queryWidth, // 화면 가로 길이 받아온걸로 지정
            height: queryHeight, // 화면 높이 받아온걸로 지정
            child: Column(
              children: [
                Header(queryWidth, queryHeight),  // 최상단
                Title(queryWidth, queryHeight)  // 설정 제목
              ],
            )
        )
    );
  }

  Widget Header(width, height) {
    return Container(
      color: Color(0xFFE1F2FC),
      width: width, // 인자로 받은 화면 가로 길이/ 인자로 받은 화면 높이
      height: height * 0.1, // 으로 child를 여기에 넣을 수 있습니다.
    );
  }

  Widget Title(width, height) {
    return Container(
      width: width, // 인자로 받은 화면 가로 길이/ 인자로 받은 화면 높이
      height: height * 0.1, // 으로 child를 여기에 넣을 수 있습니다.
      child: Row( // Row 위젯을 사용해 가로로 배치
        children: [
          Title_image(width, height),
          Title_text(width, height)
        ],
      ),
    );
  }

  Widget
// ----------------------------------------------------------------------------------
// Title 함수
Widget Title_text(width, height) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      "  설정", // 여기에 원하는 텍스트를 입력하세요.
      style: TextStyle(
        fontSize: 24, // 텍스트 크기를 지정합니다.
        fontWeight: FontWeight.bold, // 글자 굵기를 지정합니다.
        color: Colors.black, // 텍스트 색상을 지정합니다.
      ),
    ),
  );
}

Widget Title_image(width, height) {
  return Padding( // 여기에 Padding 위젯을 추가합니다.
    padding: EdgeInsets.only(left: 15.0), // 왼쪽에 10.0의 패딩을 추가합니다.
    child: Image.asset(
      'assets/setting.png', // 이미지 경로
      width: 50, // 이미지의 가로 크기
      height: 50, // 이미지의 세로 크기
    ),
  );
}



}