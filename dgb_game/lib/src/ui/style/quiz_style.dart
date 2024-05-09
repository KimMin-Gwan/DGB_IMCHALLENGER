import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/home_style.dart';


class QuizTheme extends DefaultTheme{
  Color _mainColor = Color(0xffEFF6FE);
  Color _bodyColor = Color(0xffFFFFFF);
  Color _startColor = Color(0xff89C7F2);
  Color _exampleColor = Color(0xffF7F7F7);
  TextStyle _titleTextStyle = TextStyle();
  TextStyle _exampleTextStyle = TextStyle();
  TextStyle _questTextStyle = TextStyle();
  TextStyle _infoTextStyle = TextStyle();
  TextStyle _topicTextStyle = TextStyle();

  QuizTheme(){
    _titleTextStyle = TextStyle(fontSize:30, color: getRealBlack(), fontWeight: FontWeight.w600);
    _exampleTextStyle = TextStyle(fontSize:20, color: getRealBlack(), fontWeight: FontWeight.w600);
    _questTextStyle = TextStyle(fontSize:20, color: getRealBlack(), fontWeight: FontWeight.w300);
    _infoTextStyle = TextStyle(fontSize:9, color: getRealBlack(), fontWeight: FontWeight.w200);
    _topicTextStyle = TextStyle(fontSize:15, color: getRealBlack(), fontWeight: FontWeight.w600);
  }
  Color getExampleColor() => _exampleColor;
  Color getMainColor() => _mainColor;
  Color getBodyColor() => _bodyColor;
  Color getStartColor() => _startColor;
  TextStyle getTitleTextStyle() => _titleTextStyle;
  TextStyle getExampleTextStyle() => _exampleTextStyle;
  TextStyle getQuestTextStyle() => _questTextStyle;
  TextStyle getInfoTextStyle() => _infoTextStyle;
  TextStyle getTopicTextStyle() => _topicTextStyle;
}