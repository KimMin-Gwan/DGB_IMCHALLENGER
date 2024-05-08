import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/home_style.dart'; // import DefaultTheme


// Theme를 상속하여 기본 색깔을 유지하되 추가적인 색깡르 쓸것
// 모르겠으면 home_style.dart에 내가 써둔거 참고할 것
class QuestTheme extends DefaultTheme {
  TextStyle _topicTextStyle = TextStyle();
  TextStyle _titleTextStyle = TextStyle();
  TextStyle _infoTextStyle = TextStyle();
  TextStyle _rewardTextStyle = TextStyle();
  TextStyle _todayRewardTextStyle = TextStyle();
  TextStyle _recvTextStyle = TextStyle();
  TextStyle _remainTimeTextStyle = TextStyle();
  TextStyle _gainExpTextStyle = TextStyle();

  QuestTheme(){
    _topicTextStyle = TextStyle(fontSize:16, color: getRealBlack(),fontWeight: FontWeight.w600);
    _titleTextStyle = TextStyle(fontSize:18, color: getRealBlack(),fontWeight: FontWeight.w600);
    _infoTextStyle = TextStyle(fontSize:9, color: getRealBlack(),fontWeight: FontWeight.w100);
    _rewardTextStyle = TextStyle(fontSize:9, color: getRealBlack(),fontWeight: FontWeight.w900);
    _todayRewardTextStyle = TextStyle(fontSize: 15, color: getRealBlack(), fontWeight: FontWeight.w400);
    _recvTextStyle = TextStyle(fontSize: 12, color:getRealBlack(), fontWeight: FontWeight.w100);
    _remainTimeTextStyle = TextStyle(fontSize: 8, color: getRealBlack(), fontWeight: FontWeight.w100);
    _gainExpTextStyle = TextStyle(fontSize:9, color: getRealBlack(),fontWeight: FontWeight.w100);
  }

  TextStyle getTopicTextStyle() => _topicTextStyle;
  TextStyle getTitleTextStyle() => _titleTextStyle;
  TextStyle getInfoTextStyle() => _infoTextStyle;
  TextStyle getRewardTextStyle() => _rewardTextStyle;
  TextStyle getTodayRewardTextStyle() => _todayRewardTextStyle;
  TextStyle getRecvTextStyle() => _recvTextStyle;
  TextStyle getRemainTimeTextStyle() => _remainTimeTextStyle;
  TextStyle getGainExpTextStyle() => _gainExpTextStyle;
}