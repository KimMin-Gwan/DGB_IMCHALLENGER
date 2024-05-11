import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/home_style.dart';

class LevelWidgetTheme extends DefaultTheme{
  Color _backGroundColor = Color(0xffb5b5b5);
  BoxDecoration _rewordBoxDeco = BoxDecoration();
  Color _rewordMainColor = Color(0xffd1ecff);
  TextStyle _rewordLevelText = TextStyle();
  TextStyle _rewordNameText = TextStyle();


  Color getBackGroundColor() => _backGroundColor;
  Color getRewordMainColor() => _rewordMainColor;

  LevelWidgetTheme(){
    _rewordBoxDeco = BoxDecoration(
      color : _rewordMainColor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          blurRadius: 5.0,
          spreadRadius: 0.0,
          offset: const Offset(0,4),
        )
      ]
    );
    _rewordLevelText = TextStyle(
      fontSize : 28, color: getRealBlack(), fontWeight: FontWeight.w800,
    );
    _rewordNameText = TextStyle(
      fontSize : 10, color: getRealBlack(), fontWeight: FontWeight.w800,
    );

  }
  BoxDecoration getRewordBoxDeco() => _rewordBoxDeco;
  TextStyle getRewordLevelText() => _rewordLevelText;
  TextStyle getRewordNameText() => _rewordNameText;
}


