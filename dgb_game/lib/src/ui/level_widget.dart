//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/level_style.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

class LevelWidget extends StatefulWidget {
  const LevelWidget({super.key});

  @override
  State<LevelWidget> createState() => _LevelWidgetState();
}

class _LevelWidgetState extends State<LevelWidget> {

  var _style = LevelWidgetTheme();
  final maxWidth = 400.0;
  final maxHeight = 900.0;
  final ScrollController _scrollController = ScrollController();
  var offset = 0.0;
  List<String> rewordItemName = [
    '야구모자', '전공지식', '가구', '강아지', '200원'
  ];
  double containerSizeForOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print('offset = ${_scrollController.offset}');
      setState(() {
        offset = _scrollController.offset;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(containerSizeForOffset,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double queryWidth = MediaQuery.of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {queryWidth = maxWidth;}
    double queryHeight = MediaQuery.of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryHeight> maxHeight) {queryHeight= maxHeight; }

    containerSizeForOffset = (queryWidth * 0.5 ) * 11 - queryWidth * 0.5 * 0.5;

    return Scaffold(
      body: Container(
        width: queryWidth,
        height: queryHeight,
        color: _style.getBackGroundColor(),
        child : Column(
          children :[
            headerWidget(queryWidth, queryHeight * 0.09 - 1.floorToDouble()),
            rewordWidget(queryWidth, queryHeight * 0.4+1.floorToDouble()),
            levelInformationWidget(queryWidth, queryHeight * 0.51),
          ]
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

  // 리워드 파트
  Widget rewordWidget(width, height) {
    var containerWidthSize = width * 0.3;
    var containerHeightSize = height * 0.3;

    return Container(
      width: width,
      height: height,
      //color: Colors.blue,
      child : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: makeRewordContainer(width, height),
          //[
            //Container(width:width*0.5, height: width * 0.5,),
            //rewordItemsWidget(width, height, 0),
            //rewordItemsWidget(width, height, 1),
            //rewordItemsWidget(width, height, 2),
            //rewordItemsWidget(width, height, 3),
            //rewordItemsWidget(width, height, 4),
            //rewordItemsWidget(width, height, 5),
            //Container(width:width*0.5, height: width * 0.5,),
          //]
        )
    )

    );
  }


  // 리워드 박스 80개 만드는 함수
  List<Widget> makeRewordContainer(width, height){
    List<Widget> widgetList = [];
    widgetList.add(
      Container(width:width*0.5, height: width * 0.5,),
    );
    for(int i = 0; i < 30; i++){
      widgetList.add(rewordItemsWidget(width, height, i));
    }
    widgetList.add(
      Container(width:width*0.5, height: width * 0.5,),
    );
    return widgetList;
  }

  // 그냥하면 소숫점 때문에 터져서 소숫점 버리게 하는 함수
  double truncate(double number, int digit) {
    num fac = pow(10.0, digit);
    return (number * fac).truncateToDouble() / fac;
  }

  // 리워드 슬라이드 애니메이션 결정 함수
  List sizeTransfer1(containerWidth, index){

    var halfWidth = containerWidth * 0.5;
    var nowOffset = offset - (containerWidth* index);
    var topSize = 4.0;
    var middleSize = 5.0;
    var bottomSize = 1.0;
    //var topSize = 2.0;
    //var middelSize = 6.5;
    //var bottomSize = 1.5;
    if (0 < nowOffset && nowOffset <= halfWidth ){
      topSize = 4 - (2 / halfWidth) * nowOffset;
      middleSize = (1.5 / halfWidth) * nowOffset  + 5;
      bottomSize = (0.5 / halfWidth) * nowOffset  + 1;
    }
    else if (halfWidth < nowOffset && nowOffset < containerWidth){
      topSize = (2 / halfWidth) * nowOffset;
      middleSize= 8 - (1.5 / halfWidth) * nowOffset;
      bottomSize = 2 - (0.5 / halfWidth) * nowOffset;
    }
    topSize = truncate(topSize, 3);
    middleSize = truncate(middleSize, 3);
    bottomSize = truncate(bottomSize, 3);

    var result = [topSize /10 - 0.01, middleSize/10, bottomSize/10];
    return result;
  }

  Widget rewordItemsWidget(width, height, i){
    var containerWidthSize = width * 0.5;
    var containerHeightSize = height * 0.8;
    var resultList = sizeTransfer1(containerWidthSize, i);


    return Container(
      alignment: Alignment.center ,
      height: containerHeightSize + 1,
      width: containerWidthSize,
      //color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: height * resultList[1],
            height: height * resultList[1],
            //color : Colors.blue,
            child : rewordImage(height * resultList[1], height*resultList[1], i),
          ),
          Container(
            width: width * 0.2,
            height: height * resultList[2],
            //color: Colors.orange,
          ),
        ]
      )
    );
  }


  // 리워드 이미지와 등급 반환
  Widget rewordImage(width, height, i){
    int index = i % 5;
    double containerWidth = width*0.8;
    double containerHeigth = height*0.8;

    print(containerHeigth);
    print(containerHeigth *0.6);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children:[
        Text((i+1).toString(),
          style: _style.getRewordLevelText(),
        ),
        Container(
          width:containerWidth,
          height:containerHeigth,
          decoration: _style.getRewordBoxDeco(),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:containerWidth*0.6,
                height:containerHeigth*0.6,
                //color: Colors.green,
                child : Image.asset('images/rewordImage/$index.png',
                fit:BoxFit.fill),
              ),
              Container(
                alignment: Alignment.center,
                width:containerWidth,
                height:containerHeigth*0.1 + 20,
                //color: Colors.orange,
                child: Text(rewordItemName[index],
                  style: _style.getRewordNameText(),
                ),
              )
            ]
          )
        )
      ]
    );
  }


  // 하단부 전체
  Widget levelInformationWidget(width, height){
    return Container(
      width: width,
      height: height,
      color: _style.getMainContainerColor(),
      child: Column(
        children:[
          rewordArrow(width, height *0.4),
          rewordButton(width, height * 0.35),
          rewordExp(width, height * 0.25)
        ]
      )
    );
  }

  Widget rewordArrow(width, height){
    return Container(
          width: width,
          height: height,
          child:Row(
            children: [
              Container(
                  width:width * 0.3,
                  height: height,
                  color: _style.getMainContainerColor(),
                  child: Column(
                      children:[
                        Container(width: width * 0.3, height: height*0.6,
                          decoration: BoxDecoration(
                              color: _style.getBackGroundColor(),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                              )),
                        ),
                      ]
                  )
              ),
              Container(
                  width:width * 0.4,
                  height: height,
                  color: _style.getBackGroundColor(),
                  child:Container(
                      width: width * 0.4,
                      height: width * 0.4,
                      decoration: _style.getRewordMiddleBoxDeco(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 20),
                              width: width * 0.4 * 0.4,
                              height: width * 0.4 * 0.4,
                              child:Image.asset('images/rewordImage/arrow.png')
                          ),
                          Text("보상", style: _style.getRewordTitleText(),)
                        ],
                      )
                  )
              ),
              Container(
                  width:width * 0.3,
                  height: height,
                  color: _style.getMainContainerColor(),
                  child: Column(
                      children:[
                        Container(width: width * 0.3, height: height*0.6,
                            decoration: BoxDecoration(
                                color: _style.getBackGroundColor(),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                )
                            )
                        )
                      ]
                  )
              )
            ],
      )
    );
  }

  Widget rewordButton(width, height){
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: width * 0.6,
      height: height * 0.6,
      child: ElevatedButton(
        child: Text("현재 등급",
          style: _style.getRewordButtonText(),
        ),
        onPressed: (){},
      )
    );
  }

  Widget rewordExp(width, height){
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: width,
      height: height * 0.6,
      child: Column(
        children:[
          Container(
            width: width * 0.6,
            height: height * 0.2,
            child:Text("Exp"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              LinearPercentIndicator(
                width: width * 0.6,
                lineHeight: 10,
                percent:  0.9,
                animation: true,
                barRadius: Radius.circular(10),
                progressColor: _style.getExpBarColor(),
                trailing: Text("90%"),
              )
            ]
          )
        ]
      )
    );
  }

}
