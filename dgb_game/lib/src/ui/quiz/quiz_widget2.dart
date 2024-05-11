import 'package:dgb_game/src/ui/quiz/quiz_widget_false.dart';
import 'package:dgb_game/src/ui/quiz/quiz_widget_result.dart';
import 'package:dgb_game/src/ui/quiz/quiz_widget_true.dart';
import 'package:flutter/material.dart';
import 'package:dgb_game/src/ui/style/quiz_style.dart';

class QuizWidget2 extends StatefulWidget {
  const QuizWidget2({super.key});

  @override
  State<QuizWidget2> createState() => _QuizWidget2State();
}

class _QuizWidget2State extends State<QuizWidget2> {

  var _style = QuizTheme();// 테마
  final maxWidth = 400.0;
  final maxHeight = 900.0;
  bool _buttonColor = false;
  int index = 0;
  int num = 1;
  List<String> quizList = [
    '한 가지 자산에 몰아서 투자하지 않고 여러 자산에 분산 투자하는 가장 주된 목적은?',
    '국가가 과도한 빚 부담을 이겨내지 못하고 상환능력을 잃을 때 일어날 수 있는 상황은?',
    "우리나라의 '이것'이 가파르게 증가해 지난해 1126조7000억원을 기록했다. 재정건전성 악화 우려를 키우고 있는 이 수치는?",
    '대기업과 고소득자의 성장을 촉진하면 그 혜택이 중소기업과 서민으로 이어져 경제 전체에 도움이 된다는 이론은?',
    '한국은행이 연 8회 개최하는 금융통화위원회에서 결정하는 것은?',
    "달러화가 대표적 '이것'으로 통한다. 무역, 금융 등 국제 거래에서 보편적으로 쓰이는 화폐를 뜻하는 이것은?",
    "미국 경제성장률은 둔화하고 물가상승률은 고공행진하면서 '이것'에 대한 우려가 다시 높아졌다. 이것에 적절한 단어는?",
    '부가가치세와 같이 세금을 납부하는 주체와 실제 부담하는 주체가 다른 세금을 뜻하는 말은?',
    '코인의 가치를 법정화폐에 연동하는 등의 방식으로 가격이 안정적으로 유지되도록 설계한 암호화폐는?',
    '한국은 1997년 외환위기 당시 이 국제기구에서 자금을 지원받고 강도 높은 구조조정을 했다. ‘국제통화기금’을 뜻하는 이곳은?',
  ];

  List<List<String>> answerList = [
    ['복리 효과','과세 이연','절세 효과','위험 회피'], //4
    ['캐즘', '어닝쇼크', '디폴트', '유동성랠리'],  //3
    ['가계부채','국가채무','통화량','CDS프리미엄'], //2
    ['낙수효과','분수효과','톱니효과','기저효과'], //1
    ['코픽스','가산금리','기준금리','우대금리'], //3
    ['핫머니','통화스와프','안전자산','기축통화'], //4
    ['디플레이션','스태그플레이션','빅스텝','베이비스텝'], //2
    ['준조세','누진세','직접세','간접세'], //4
    ['비트코인','대체불가능코인','다크코인','스테이블코인'], //4
    ['IMF','WB','WTO','G7'], //1
  ];
  List<int> answer_number = [4,3,2,1,3,4,2,4,4,1];
  int current_block = -1;
  int ans_num = 0;
  int answer = -1;
  List<String> img_path = [
    './images/funny_dan.png', './images/sad_dan.png'
  ];

  bool img = false;
  bool flag = false;
  void answerButton(){
    setState(() {

      if(index<10) {
        index++;
        ans_num++;
        num++;
        // _buttonColor = false;
        current_block = -1;
        print(index);
        print(num);
      }
    });
  }
  String imgg = './images/sad_dan.png';
  String path = './images/funny_dan.png';
  String fpath = './images/sad_dan.png';
  String correct = '정답이에요!';
  String fail = '틀렸어요!';
  String res = '';
  void isCorrect(){
    if(current_block == answer_number[index])
      {
          flag = true;
          imgg = path;
          res = correct;
      }
    else
      {
          flag = true;
          imgg = fpath;
          res = fail;
      }
  }
  bool falseClick = false;
  void trueFalse(){
      setState(() {
        if(index == quizList.length){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>QuizResult())
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    double queryWidth = MediaQuery .of(context).size.width;
    // 가로 최대 길이를 400으로 한정
    if (queryWidth > maxWidth) {
      queryWidth = maxWidth;
    }
    double queryHeight = MediaQuery .of(context).size.height;
    // 세로 최대 길이를 1200으로  한정
    if (queryHeight > maxHeight) {
      queryHeight = maxHeight;
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: queryWidth,
              height: queryHeight,
              color: _style.getMainColor(),
              child: Column(
                children: [
                  backPart(queryWidth,queryHeight),
                  topPart(queryWidth,queryHeight),
                  middlePart(queryWidth,queryHeight),
                  bottomPart(queryWidth,queryHeight),
                ],
              )
          ),
          InkWell(
            onTap: (){
              setState(() {
                flag = false;
                imgg = './images/sad_dan.png';
                res = '';
                trueFalse();
              });
            },
            child: Container(
                width: queryWidth,
                height: flag ? queryHeight : 0,
                color: Colors.black26,
                child: SizedBox(
                    width: queryWidth,
                    height: queryHeight*0.8,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: queryWidth,
                              height: queryHeight * 0.5,
                              child: Image.asset(imgg),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: queryWidth,
                              height: queryHeight * 0.1,
                              child: Text('$res', style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w800),),
                            )
                          ],
                        )
                    )
                )
            )
          ),
        ],
      )
    );
  }

  Widget trueImage(width, height){
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: width,
      height: height * 0.5,
      child: Image.asset('./images/happy_dan.png'),
    );
  }

  Widget backPart(width, height){
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: (){
          Navigator.pop(context);
          },
      ),
      width: width,
      height: height * 0.1,
    );
  }
  Widget topPart(width, height){
    return Container(
      width: width,
      height: height * 0.3,
      color: _style.getMainColor(),
      child: Column(
        children: [
        numQuest(width, height),
        question(width, height, quizList[index]),
      ]
      ),
    );
  }

  Widget numQuest(width, height){
    return Container(
      width: width,
      height: height * 0.1,
      color: _style.getMainColor(),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('./images/think.png'),
            width: 35,
            height: height * 0.07,
          ),
          Container(
              alignment: Alignment.topCenter,
              width: width * 0.5,
              height: height * 0.03,
              child: Text('$num/10')
          ),
        ],
      ),
    );
  }

  Widget question(width, height, quest){
    return Container(
      alignment: Alignment.center,
      width: width * 0.8,
      height: height * 0.2,
      child: Text(quest, style: _style.getQuestTextStyle()),
    );
  }

  Widget middlePart(width, height){
    return Container(
      width: width,
      height: height * 0.5,
      color: _style.getMainColor(),
      child: Column(
        children: [
          selectedBox(width, height, answerList[ans_num][0],0),
          selectedBox(width, height, answerList[ans_num][1],1),
          selectedBox(width, height, answerList[ans_num][2],2),
          selectedBox(width, height, answerList[ans_num][3],3),
        ],
      )
    );
  }

  //선택전
  Widget selectBox(width, height, example, int blockIndex){
    return Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              current_block = blockIndex+1;
            });
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.96,
              height: height * 0.10,
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Text(example, style: _style.getExampleTextStyle())
          ),
        ),
        Container(
          width: width,
          height: 10,
          color: _style.getMainColor(),
        ),
      ],
    );
  }

  //선택된 버튼
  Widget selectedBox(width, height, example,int blockIndex){
    return Column(
          children: [
            InkWell(
              onTap: (){
                print("버튼눌림");
                print(_buttonColor);
                setState(() {
                  current_block = blockIndex+1;
                  print(current_block);
                  // _buttonColor = !_buttonColor;
                });
                },
              child: Container(
                  alignment: Alignment.center,
                  width: width * 0.96,
                  height: height * 0.11,
                  decoration: BoxDecoration(
                    color: current_block==blockIndex+1 ? Color(0xff038AE4) : Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  child: Text(example, style: _style.getExampleTextStyle())
              ),
            ),
            Container(
              width: width,
              height: 10,
              color: _style.getMainColor(),
            ),
          ],
    );
  }


  Widget bottomPart(width, height){
    return Container(
      width: width,
      height: height * 0.1,
      color: _style.getMainColor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          jump(width, height),
          decision(width, height),
        ],
      ),
    );
  }
  Widget jump(width, height){
    return InkWell(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        width: width * 0.45,
        height: height,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: Text('건너뛰기', style: _style.getQuestTextStyle()),
      ),
    );
  }
  Widget decision(width, height){
    return InkWell(
      onTap: (){
        // isCorrect();
        setState(() {
              isCorrect();
              answerButton();
        });
        },
      child: Container(
          alignment: Alignment.center,
          width: width * 0.45,
          height: height,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: Text('결정', style: _style.getQuestTextStyle())
      ),
    );
  }

}
