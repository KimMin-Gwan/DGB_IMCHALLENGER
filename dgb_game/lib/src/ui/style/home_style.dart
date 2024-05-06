import 'package:flutter/material.dart';


// 16진수 색깔 코드를 찾아서 적으면됨 -> (0xff + 6자리)
// 색깔 코드는 피그마에 Fill 부분(색깔 넣는 부분)에 6자리로 적혀있음
// 색깔은 Color 타입
// 텍스트는 TextStyle 타입
// 버튼은 ButtonStyle 타입

// 색깔은 그냥 정의하면 되는데 나머지는 생성자에서 정의해야됨
// 아래에 HomeScaffoldTheme에 정의한 것 참고

// 다 쓰고 나면 아래에 적힌 예시처럼 get함수 만들어서 반환하면됨(접근자)
// 함수이름 => 리턴할 대상   | 이건 다트언어 특징인 빠른 반환 문법

class DefaultTheme{
  Color realWhite = Color(0xffffffff);
  Color realBlack = Color(0xff000000);
  Color mainWhiteColor = Color(0xfff7faff);
  Color menuDefaultColor = Color(0xff8f8288);
  Color menuDefaultStokeColor = Color(0xff787276);
  Color mainGrayColor = Colors.grey;

  Color getRealWhite() => realWhite;
  Color getRealBlack() => realBlack;
  Color getMainWhite() => mainWhiteColor;
  Color getMenuDefaultColor() => menuDefaultColor;
  Color getMenuDefaultStokeColor() => menuDefaultStokeColor;
  Color getMainGrayColor() => mainGrayColor;

}


// Theme를 상속하여 기본 색깔은 유지하되 추가적인 색깔을 쓸것
class HomeScaffoldTheme extends DefaultTheme{
  Color _widgetBoxGrayColor = Color(0xff393939).withOpacity(0.8);
  ButtonStyle _simpleButton = ButtonStyle();
  TextStyle _levelTextStyle = TextStyle();

  // 아래는 생성자
  HomeScaffoldTheme(){
    // 여기서 정의해주면 됨
    _simpleButton = ElevatedButton.styleFrom(
      minimumSize: Size(100, 50),
      backgroundColor: getMainGrayColor(),
      surfaceTintColor: getRealWhite(),
      foregroundColor: getRealWhite(),
      shape : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: getRealBlack(),
    ); // ; 잊지말것
    _levelTextStyle = TextStyle(fontSize: 12, color: getRealBlack());

  }// 생성자는 인스턴스 생성할 때 실행됨

  // 아래는 접근자
  Color getWidgetBoxGrayColor() => _widgetBoxGrayColor;
  ButtonStyle getSimpleButtonStyle() => _simpleButton;
  TextStyle getlevelTextStyle() => _levelTextStyle;

}
