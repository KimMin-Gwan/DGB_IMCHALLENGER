import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/home_style.dart';

class LevelWidgetTheme extends DefaultTheme{
  Color _backGroundColor = Color(0xffb5b5b5);
  BoxDecoration _rewordBoxDeco = BoxDecoration();
  BoxDecoration _rewordMiddleBoxDeco= BoxDecoration();
  Color _rewordMainColor = Color(0xffd1ecff);
  Color _expBarColor = Color(0xffcdccf8);
  TextStyle _rewordLevelText = TextStyle();
  TextStyle _rewordNameText = TextStyle();
  TextStyle _rewordTitleText = TextStyle();
  TextStyle _rewordButtonText= TextStyle();


  Color getBackGroundColor() => _backGroundColor;
  Color getRewordMainColor() => _rewordMainColor;

  LevelWidgetTheme(){
    _rewordMiddleBoxDeco = BoxDecoration(
      color : _rewordMainColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      )
    );
    _rewordBoxDeco = BoxDecoration(
      color : _rewordMainColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black26.withOpacity(0.4),
          blurRadius: 1.0,
          spreadRadius: 0.0,
          offset: const Offset(0,5),
        )
      ]
    );
    _rewordLevelText = TextStyle(
      fontSize : 22, color: getRealBlack(), fontWeight: FontWeight.w800,
    );
    _rewordNameText = TextStyle(
      fontSize : 15, color: getRealBlack(), fontWeight: FontWeight.w800,
    );
    _rewordTitleText= TextStyle(
      fontSize : 20, color: getRealBlack(), fontWeight: FontWeight.w900,
    );
    _rewordButtonText = TextStyle(
      fontSize : 45, color: getRealBlack(), fontWeight: FontWeight.w900,
    );

  }
  Color getExpBarColor() => _expBarColor;
  BoxDecoration getRewordMiddleBoxDeco() => _rewordMiddleBoxDeco;
  BoxDecoration getRewordBoxDeco() => _rewordBoxDeco;
  TextStyle getRewordLevelText() => _rewordLevelText;
  TextStyle getRewordNameText() => _rewordNameText;
  TextStyle getRewordTitleText() => _rewordTitleText;
  TextStyle getRewordButtonText() =>  _rewordButtonText;
}


