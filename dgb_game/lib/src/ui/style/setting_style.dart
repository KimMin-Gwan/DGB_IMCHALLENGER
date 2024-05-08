import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/home_style.dart';


// Theme를 상속하여 기본 색깔을 유지하되 추가적인 색깡르 쓸것
// 모르겠으면 home_style.dart에 내가 써둔거 참고할 것
class SettingTheme extends DefaultTheme{
  TextStyle _topicTextStyle = TextStyle();
  TextStyle _titleTextStyle = TextStyle();

  SettingTheme(){
    _topicTextStyle = TextStyle(fontSize: 18, color: getRealBlack(), fontWeight: FontWeight.w300);
    _titleTextStyle = TextStyle(fontSize: 18, color: getRealBlack(), fontWeight: FontWeight.bold,);
  }
  TextStyle getTopicTextStyle() => _topicTextStyle;
  TextStyle getTitleTextStyle() => _titleTextStyle;
}