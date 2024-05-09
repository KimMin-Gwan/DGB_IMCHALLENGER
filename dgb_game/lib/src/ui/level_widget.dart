import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/level_style.dart';

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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print('offset = ${_scrollController.offset}');
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

    print("hello");
    print(queryWidth);
    return Scaffold(
      body: Container(
        width: queryWidth,
        height: queryHeight,
        color: Colors.blueGrey,
        child : Column(
          children :[
            rewordWidget(queryWidth, queryHeight * 0.4),
        ]
        )
      )
    );
  }

  Widget rewordWidget(width, height) {
    var containerWidthSize = width * 0.3;
    var containerHeightSize = height * 0.3;

    return Container(
      width: width,
      height: height,
      color: Colors.blue,
      child : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            rewordItemsWidget(width, height, 0),
            rewordItemsWidget(width, height, 1),
            rewordItemsWidget(width, height, 2),
            rewordItemsWidget(width, height, 3),
            rewordItemsWidget(width, height, 4),
            rewordItemsWidget(width, height, 5),
          ]
        )
    )

    );
  }

  List sizeTransfer1(containerWidth, index){
    var offset = _scrollController.offset;
    var nowOffset = offset - (containerWidth * index);
    var halfWidth = containerWidth * 0.5;
    var topSize = 5.0;
    var middleSize = 4.0;
    var bottomSize = 1.0;
    //var topSize = 3.0;
    //var middelSize = 5.0;
    //var bottomSize = 2.0;
    var result = [topSize, middleSize, bottomSize];
    if (0 < nowOffset && halfWidth < nowOffset){
      topSize = 5 - (2 / halfWidth) * nowOffset;
      middleSize = (1 / halfWidth) * nowOffset  + 4;
      bottomSize = (1 / halfWidth) * nowOffset  + 1;
    }
    else if (halfWidth > nowOffset && containerWidth < nowOffset){
      topSize = (2 / halfWidth) * nowOffset + 3;
      middleSize= 5 - (1 / halfWidth) * nowOffset;
      bottomSize = 2 - (1 / halfWidth) * nowOffset;
    }
    return result;
  }

  Widget rewordItemsWidget(width, height, i){
    var containerWidthSize = width * 0.5;
    var containerHeightSize = height * 0.8;
    var resultList = sizeTransfer1(containerWidthSize, i);

    return Container(
      alignment: Alignment.center ,
      height: containerHeightSize,
      width: containerWidthSize,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * 0.2,
            height: resultList[0],
            color: Colors.orange,
          ),
          Container(
            width: height * resultList[1],
            height: height * resultList[1],
            color: Colors.yellow,
          ),
          Container(
            width: width * 0.2,
            height: height * resultList[3],
            color: Colors.redAccent,
          ),
        ]
      )
    );
  }


}
