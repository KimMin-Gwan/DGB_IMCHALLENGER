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

    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: _style.getMainWhite(),
        foregroundColor: _style.getMainWhite(),
        elevation: 0,

        actions: [
          IconButton(
           icon: Icon(Icons.menu, color: _style.getMenuDefaultColor()),
            onPressed: (){},
          )
        ]
      ),
       */
      body: QuestBodyWidget(),
    );
  }
}
class QuestBodyWidget extends StatefulWidget {
  @override
  _QuestBodyWidgetState createState() => _QuestBodyWidgetState();
}

class _QuestBodyWidgetState extends State<QuestBodyWidget> {
  var _style = QuestTheme(); // 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;
  bool _buttonColor = false;



  @override
  Widget build(BuildContext context) {
    double queryWidth = MediaQuery
        .of(context)
        .size
        .width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {
      queryWidth = maxWidth;
    }
    double queryHeight = MediaQuery
        .of(context)
        .size
        .height;
    // 세로 최대 길이를 1200으로  한정
    if (queryWidth > maxHeight) {
      queryWidth = maxHeight;
    }
    return Container( // 이 녀석은 배경 밑에 있는 도화지 같은 녀석
        color: _style.getMainWhite(),
        width: queryWidth,
        height: queryHeight,
        child: Column( //그리기 부분
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                width: queryWidth,
                height: queryHeight * 0.1,
                color: Color(0xffE1F2FC),
              ),
              DayQuestBlock(queryWidth, queryHeight),
              WeekQuestBlock(queryWidth, queryHeight),
            ]
        )
    );
  }


//퀘스트 블록
  Widget DayQuestBlock(width, height) {
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.3,
              color: Color(0xffEFF6FE),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.09,
                      color: Color(0xffEFF6FE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 7),
                            child: Text('오늘 받을 수 있는 보상', style: _style.getTitleTextStyle()),
                          ),
                          RemainTime(width, height),
                        ],
                      )
                    ),
                    QuestAttendance(width, height),
                    QuestInteraction(width, height),
                  ]
              )
          )
        ]
    );
  }

  Widget WeekQuestBlock(width, height){
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.6,
              color: Color(0xffEFF6FE),
              child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.09,
                      color: Color(0xffEFF6FE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 7),
                              child: Text('주간 미션 보상 (계좌 연동 필요)', style: _style.getTitleTextStyle())
                          ),
                          RemainTime(width, height)
                        ],
                      )
                    ),
                    QuestNoTaxi(width, height),
                    QuestNoOrder(width, height),
                    QuestQuizKing(width, height),
                    QuestInvestment(width, height),
                  ]
              )
          )
        ]
    );
  }

//퀘스트 1개 정보 / 출석체크 퀘스트
  Widget QuestAttendance(width, height) {
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.09,
              color: Color(0xffD1ECFF),
              child: Row(
                children: [
                  QuestImageAttendance(width, height),
                  Container(
                    child: QuestInfoAttendance(width, height)
                  ),
                  QuestCompleteBefo(width, height),
                ],
              )
          ),
          Container(
            width: width,
            height: 10,
            color: Color(0xffEFF6FE),
          )
        ]
    );
  }
  //상호 작용 퀘스트
  Widget QuestInteraction(width, height) {
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.09,
              color: Color(0xffD1ECFF),
              child: Row(
                children: [
                  QuestImageInteraction(width, height),
                  Container(
                      child: QuestInfoInteraction(width, height)
                  ),
                  QuestCompleteAfter(width, height),
                ],
              )
          ),
          Container(
            width: width,
            height: 10,
            color: Color(0xffEFF6FE),
          )
        ]
    );
  }
  //택시 안타기 퀘스트
  Widget QuestNoTaxi(width, height) {
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.09,
              color: Color(0xffD1ECFF),
              child: Row(
                children: [
                  QuestImageNoTaxi(width, height),
                  Container(
                      child: QuestInfoNoTaxi(width, height)
                  ),
                  QuestCompleteBefo(width, height),
                ],
              )
          ),
          Container(
            width: width,
            height: 10,
            color: Color(0xffEFF6FE),
          )
        ]
    );
  }
  //배달 덜 시키기 퀘스트
  Widget QuestNoOrder(width, height) {
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.09,
              color: Color(0xffD1ECFF),
              child: Row(
                children: [
                  QuestImageNoOrder(width, height),
                  Container(
                      child: QuestInfoNoOrder(width, height)
                  ),
                  QuestCompleteBefo(width, height),
                ],
              )
          ),
          Container(
            width: width,
            height: 10,
            color: Color(0xffEFF6FE),
          )
        ]
    );
  }
  //퀴즈왕 퀘스트
  Widget QuestQuizKing(width, height) {
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.09,
              color: Color(0xffD1ECFF),
              child: Row(
                children: [
                  QuestImageQuizKing(width, height),
                  Container(
                      child: QuestInfoQuizKing(width, height)
                  ),
                  QuestCompleteBefo(width, height),
                ],
              )
          ),
          Container(
            width: width,
            height: 10,
            color: Color(0xffEFF6FE),
          )
        ]
    );
  }
  //적금 들기 퀘스트
  Widget QuestInvestment(width, height) {
    return Column(
        children: [
          Container(
              width: width,
              height: height * 0.09,
              color: Color(0xffD1ECFF),
              child: Row(
                children: [
                  QuestImageInvestment(width, height),
                  Container(
                      child: QuestInfoInvestment(width, height)
                  ),
                  QuestCompleteBefo(width, height),
                ],
              )
          ),
          Container(
            width: width,
            height: 10,
            color: Color(0xffEFF6FE),
          )
        ]
    );
  }
  //달력 이미지(출석체크)
  Widget QuestImageAttendance(width, height) {
    return Container(
      child: Image.asset('./calendar.png'),
      width: width * 0.15,
      height: height * 0.05,
    );
  }
  //말풍선 이미지(상호작용)
  Widget QuestImageInteraction(width, height) {
    return Container(
      child: Image.asset('./chat.png'),
      width: width * 0.15,
      height: height * 0.05,
    );
  }
  //택시 이미지(택시 안타기)
  Widget QuestImageNoTaxi(width, height) {
    return Container(
      child: Image.asset('./kakaoT.png'),
      width: width * 0.15,
      height: height * 0.05,
    );
  }
  //배달 이미지(배달음식 덜먹기)
  Widget QuestImageNoOrder(width, height) {
    return Container(
      child: Image.asset('./baemin.png'),
      width: width * 0.15,
      height: height * 0.05,
    );
  }
  //왕관 이미지(퀴즈킹)
  Widget QuestImageQuizKing(width, height) {
    return Container(
      child: Image.asset('./crown.png'),
      width: width * 0.15,
      height: height * 0.05,
    );
  }
  //투자 이미지(적금들기)
  Widget QuestImageInvestment(width, height) {
    return Container(
      child: Image.asset('./investment.png'),
      width: width * 0.15,
      height: height * 0.05,
    );
  }

  //출석체크 퀘스트 설명
  Widget QuestInfoAttendance(width, height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: width * 0.59,
              height: height * 0.03,
              margin: EdgeInsets.only(top:4),
              color: Color(0xffD1ECFF),
              child: Text('출석 보상', style: _style.getTopicTextStyle())
          ),
          Container(
              alignment: Alignment.bottomLeft,
              width: width * 0.59,
              height: height * 0.03,
              color: Color(0xffD1ECFF),
              child: Text('출석하면 받을 수 있어요!', style: _style.getInfoTextStyle())
          ),
          // Container(
          //     alignment: Alignment.centerLeft,
          //     width: width * 0.59,
          //     height: height*0.03,
          //     color: Colors.redAccent,
          //     child: Text('경험치 + 5pt', style: _style.getGainExpTextStyle())
          // ),
          Exp5Mount(width, height),
        ]
    );
  }
  //상호작용 퀘스트 설명
  Widget QuestInfoInteraction(width, height) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: width * 0.59,
              height: height * 0.03,
              margin: EdgeInsets.only(top:4),
              color: Color(0xffD1ECFF),
              child: Text('상호 작용 보상', style: _style.getTopicTextStyle())
          ),
          Container(
              alignment: Alignment.bottomLeft,
              width: width * 0.59,
              height: height * 0.03,
              color: Color(0xffD1ECFF),
              child: Text('단디와 대화하면 받을 수 있어요!', style: _style.getInfoTextStyle())
          ),
          Exp5Mount(width, height),
        ]
    );
  }
  //택시 안타기 설명
  Widget QuestInfoNoTaxi(width, height) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: width * 0.59,
              height: height * 0.03,
              margin: EdgeInsets.only(top:4),
              color: Color(0xffD1ECFF),
              child: Text('택시 기사님 미안해요', style: _style.getTopicTextStyle())
          ),
          Container(
              alignment: Alignment.bottomLeft,
              width: width * 0.59,
              height: height * 0.03,
              color: Color(0xffD1ECFF),
              child: Text('일주일 동안 택시를 타지 않으면 받을 수 있어요!', style: _style.getInfoTextStyle())
          ),
          Exp20Mount(width, height),
        ]
    );
  }
  //배달 덜 시키기 설명
  Widget QuestInfoNoOrder(width, height) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: width * 0.59,
              height: height * 0.03,
              margin: EdgeInsets.only(top:4),
              color: Color(0xffD1ECFF),
              child: Text('사실 우리는 집밥의 민족', style: _style.getTopicTextStyle())
          ),
          Container(
              alignment: Alignment.bottomLeft,
              width: width * 0.59,
              height: height * 0.03,
              color: Color(0xffD1ECFF),
              child: Text('배달 음식을 일주일 동안 시켜먹지 않으면 받을 수 있어요!', style: _style.getInfoTextStyle())
          ),
          Exp20Mount(width, height),
        ]
    );
  }
  //퀴즈왕 설명
  Widget QuestInfoQuizKing(width, height) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: width * 0.59,
              height: height * 0.03,
              margin: EdgeInsets.only(top:4),
              color: Color(0xffD1ECFF),
              child: Text('금주의 퀴즈왕!', style: _style.getTopicTextStyle())
          ),
          Container(
              alignment: Alignment.bottomLeft,
              width: width * 0.59,
              height: height * 0.03,
              color: Color(0xffD1ECFF),
              child: Text('일주일 간 총 40개의 퀴즈를 맞추면 받을 수 있어요.', style: _style.getInfoTextStyle())
          ),
          Exp20Mount(width, height),
        ]
    );
  }
  //적금 들기 설명
  Widget QuestInfoInvestment(width, height) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              width: width * 0.59,
              height: height * 0.03,
              margin: EdgeInsets.only(top:4),
              color: Color(0xffD1ECFF),
              child: Text('내일의 나를 위한 투자', style: _style.getTopicTextStyle())
          ),
          Container(
              alignment: Alignment.bottomLeft,
              width: width * 0.59,
              height: height * 0.03,
              color: Color(0xffD1ECFF),
              child: Text('적금에 저축을 한 기록이 있다면 받을 수 있어요.', style: _style.getInfoTextStyle())
          ),
          Exp20Mount(width, height),
        ]
    );
  }
  //5경험치 보상
  Widget Exp5Mount(width, height){
    return Container(
        alignment: Alignment.bottomLeft,
        width: width * 0.59,
        height: height*0.02,
        margin: EdgeInsets.only(bottom:3),
        color: Color(0xffD1ECFF),
        child: Text('경험치 + 5pt', style: _style.getGainExpTextStyle())
    );
  }
  //20경험치 보상
  Widget Exp20Mount(width, height){
    return Container(
        alignment: Alignment.centerLeft,
        width: width * 0.59,
        height: height*0.02,
        margin: EdgeInsets.only(bottom:3),
        color: Color(0xffD1ECFF),
        child: Text('경험치 + 20pt', style: _style.getGainExpTextStyle())
    );
  }
  //40경험치 보상
  Widget Exp40Mount(width, height){
    return Container(
        alignment: Alignment.centerLeft,
        width: width * 0.59,
        height: height*0.02,
        margin: EdgeInsets.only(bottom:3),
        color: Color(0xffD1ECFF),
        child: Text('경험치 + 40pt', style: _style.getGainExpTextStyle())
    );
  }


  //받기 누르기 전
  Widget QuestCompleteBefo(width, height) {
    return Container(
        alignment: Alignment.center,
        width: width * 0.19,
        height: height * 0.05,
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(right:2),
                width: width * 0.05,
                height: height,
                child: Image.asset('./gift-box.png')
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 3),
              child: Text("보상 받기", style: _style.getRewardTextStyle()),
            ),
          ],
        )
    );
  }
  //받기 누른 후
  Widget QuestCompleteAfter(width, height) {
    return InkWell(
       onTap: (){
         print("버튼눌림");
         print(_buttonColor);
         setState(() {
           _buttonColor = true;
         });
       },
      child: Container(
        alignment: Alignment.center,
        width: width * 0.19,
        height: height * 0.05,
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: _buttonColor ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right:2),
              width: width * 0.05,
              height: height,
              child: Image.asset('./gift-box.png')
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 3),
              child: Text("보상 받기", style: _style.getRewardTextStyle()),
            ),
          ],
        )
      )
    );
  }

//오늘 보상
  Widget TodayReward(width, height) {
    return Column(
        children: [
          Container(
            width: width,
            height: height * 0.5,
          ),
          Container(),
        ]
    );
  }
//남은 시간
  Widget RemainTime(width, height){
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.only(left: 7, bottom:5),
          child: Image.asset('./wall-clock.png'),
        ),
        Container(
            margin: EdgeInsets.only(left: 3, bottom: 5),
          child: Text('미션은 매일 밤 12시에 초기화돼요.',style: _style.getRemainTimeTextStyle())
        ),
      ]
    );
  }

}