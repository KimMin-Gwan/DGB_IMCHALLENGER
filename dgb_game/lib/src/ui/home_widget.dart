import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/home_style.dart';


// 이거는 건들이지 말고
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

// 이걸 만들어야 됨
class _HomeWidgetState extends State<HomeWidget> {

  var _style = HomeScaffoldTheme();  // 테마
  final maxWidth = 400.0;
  final maxHeight = 1200.0;

  @override
  Widget build(BuildContext context) {
    // 화면의 가로 세로 길이를 받아오기
    double queryWidth = MediaQuery.of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {queryWidth = maxWidth;}
    double queryHeight = MediaQuery.of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryWidth > maxHeight) {queryWidth = maxHeight; }

    // 본문 위젯
    return Scaffold(
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
      body: HomeBodyWidget(),
    );
  }
}

class HomeBodyWidget extends StatefulWidget {
  @override
  _HomeBodyWidgetState createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget>{
  var _style = HomeScaffoldTheme();  // 테마
  final maxWidth = 400.0;
  final maxHeight = 1200.0;
  @override
  Widget build(BuildContext context) {
    double queryWidth = MediaQuery.of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {queryWidth = maxWidth;}
    double queryHeight = MediaQuery.of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryWidth > maxHeight) {queryWidth = maxHeight; }
    return Container(  // 이 녀석은 배경 밑에 있는 도화지 같은 녀석
      color: _style.getMainWhite(),
      width:  queryWidth,
      height: queryHeight,
      alignment: Alignment.center, // 정렬
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('./background.jpg'),
                fit:BoxFit.cover,
              )
            ),
          ),
          Column(  // 이제 진짜로 그릴꺼
            children:[
              TopBodyWidget(queryWidth, queryHeight), //길어져서 뜯어버림
              Container( //중단
                height: queryHeight * 0.6,  //전체 새로 길이중 60%
                width: queryWidth,
                // child : Container() // 단디가 등장할 부분을 그려야됨
              ),
              Container( //하단
                  height: queryHeight * 0.2,  //전체 새로 길이중 20%
                  width: queryWidth,
                  child: Row(
                    children: [
                      Column( // 하단 상태 표시줄
                        children: [
                          Container(), // 자동 증가량
                          Container() // 하트 저장량
                        ],
                      ),
                      Container( //퀴즈 버튼

                      )
                    ],
                  )
                )
            ]
          )
        ]
      )
    );
  }

  // 위 본문에 적으면 복잡해서 때어 낸 탑 부분
  // 나머지 미들과 바텀도 나중에 뜯어낼 것임
  Widget TopBodyWidget(width, height){
    return Container( //상단
        height: height * 0.1,  //전체 새로 길이중 10%
        width: width * 0.5,
        child: Container( // 레벨 및 경험치 박스
          color: _style.getWidgetBoxGrayColor(),
          width: width * 0.5,
          height: height * 0.08,
          // 레벨 데이터를 넣어야되는 데 일단은 그냥 상수값 때려박음
          child : Text('레벨임', style: _style.getlevelTextStyle())
        )
    );
  }
}

