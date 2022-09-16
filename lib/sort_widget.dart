import 'package:flutter/material.dart';

class SortWidget extends StatefulWidget {
  const SortWidget({Key? key}) : super(key: key);

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {

  late Size screenSize; //ขนาดหน้าจอ
  var RowAmount = 6.0;//จำนวนแถว
  var colAmount = 5.0;///จำนวนคอลลั่ม
  var cellWidth = 0.0; ///ความกว้างของ Widget
  var cellHeigth = 0.0; //ความสูงของ Widget
  var xScreen = 0.0;//ตำแหน่งแนวราบ
  var yScreen = 0.0;//ตำแหน่งแนวสูง
  List<Widget> widgetTest =[];//เก็บค่า Widget
  int Arr = 100; //Index

  reStack(){
    return SingleChildScrollView(
      child: Container(
        height: yScreen,
        child: Stack(
          children: widgetTest
        ),
      ),
    );
  }

  void addIndex(){
    if(Arr>0){
      widgetTest.add(
          Positioned(
          top: yScreen,
          left: xScreen,
          child: Container(
            width: cellWidth,
            height: cellHeigth,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                //padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          )));


      xScreen+=cellWidth;
      Arr--;
      if(xScreen>screenSize.width){

        xScreen =0;
        yScreen+=cellHeigth;
      }
      addIndex();
    }else{
      setState(() {
      });
    }
  }




  @override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    cellWidth = screenSize.width/colAmount;
    cellHeigth = screenSize.height/RowAmount;
    addIndex();

    return Scaffold(
      body: SafeArea(
        child: reStack(),
      )
    );
  }
}
