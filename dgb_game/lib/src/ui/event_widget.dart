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
                  headerWidget(queryWidth, queryHeight * 0.09),
                  title(queryWidth, queryHeight * 0.09),
                  eventBlock(queryWidth, queryHeight, 'event1.jpg'),
                  eventBlock(queryWidth, queryHeight, 'event2.jpg'),
                  eventBlock(queryWidth, queryHeight, 'event3.jpg')

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

  Widget title(width, height) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      color: _style.getMainWhite(),
      child: Text('      현재 진행중인 이벤트', style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700
      ),),
    );
  }

  Widget eventBlock(width, height, eventName){
      return Column(
        children:[
          // 이벤트 사진
          Image.asset(eventName),

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



