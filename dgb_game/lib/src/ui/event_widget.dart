import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/quest_style.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({super.key});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {

  var _style = QuestTheme();
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

    return Scaffold(
      body:Container(
        width: queryWidth,
        height: queryHeight,
        color: _style.getMainContainerColor(),
        child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  headerWidget(queryWidth, queryHeight * 0.1),
                  // title - '진행중인 이벤트'
                  eventBlock(queryWidth, queryHeight, '제일 첫번째 이벤트'),
                  eventBlock(queryWidth, queryHeight, '제일 첫번째 이벤트'),
                  eventBlock(queryWidth, queryHeight, '제일 첫번째 이벤트'),
                  eventBlock(queryWidth, queryHeight, '제일 첫번째 이벤트'),
                  eventBlock(queryWidth, queryHeight, '제일 첫번째 이벤트'),
                  eventBlock(queryWidth, queryHeight, '제일 첫번째 이벤트'),
                  eventBlock(queryWidth, queryHeight, '제일 첫번째 이벤트'),
                  //eventBlock(queryWidth, queryHeight, 'event1.png'),
                ]
            )
        )
      )
    );
  }

  Widget headerWidget(width, height){
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      width: width,
      height: height,
      color: Color(0xffE1F2FC),
    );
  }

  Widget eventBlock(width, height, eventName){
      return Column(
        children:[
          // 이벤트 사진
          Container(
            width: width,
            height: height * 0.2,
            color: Colors.green,
            child: Text(eventName)
            //child: Image.asset(eventName)
          ),
          // 힌색 컨테이너
          Container(
            width: width,
            height: 15,
            color: _style.getRealWhite(),
          ),
        ]
    );
  }

}



