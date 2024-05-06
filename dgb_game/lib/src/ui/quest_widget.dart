// 양승준시가 작업해야하는 파일
// 피그마를 보고 화면에 나올 위젯을 그대로 그리면됨
// 색깔, 폰트 등등 설정은 전부다 _style에 적을것
// _style에 적는다는 말은 QuestTheme class에 적을것 (home_style.dart 참고)
// 테스트를 진행할 때 main.dart에 home: 부분을 변경할 것 (본인것으로)

import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/quest_style.dart';


// 이녀석은 건들이지 말고
class QuestWidget extends StatefulWidget {
  const QuestWidget({super.key});

  @override
  State<QuestWidget> createState() => _QuestWidgetState();
}

// 이녀석을 만들어야됨 여기부터 아래 작성하면됨
// 모르겠으면 home_widget.dart 참고할것
class _QuestWidgetState extends State<QuestWidget> {

  var _style = QuestTheme();  // 테마
  final maxWidth = 400.0;
  final maxHeight = 1200.0;

  // 핵심 실행 함수 : build()
  @override
  Widget build(BuildContext context) {
    // 화면의 가로 세로 길이를 받아오기
    double queryWidth = MediaQuery.of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {queryWidth = maxWidth;}
    double queryHeight = MediaQuery.of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryWidth > maxHeight) {queryWidth = maxHeight; }

    return Container(
      color: _style.getMainWhite(),  // 이런식으로 색깔 지정
      width: queryWidth, // 화면 가로 길이 받아온걸로 지정
      height: queryHeight, // 화면 높이 받아온걸로 지정
      child: Container()  // 이런식으로 child 추가해 나갈것
    );
  }
}
