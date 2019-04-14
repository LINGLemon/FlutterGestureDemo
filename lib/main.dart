import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String printString = '';
  double moveX = 0;
  double moveY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('点击事件'),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _printMsg('点击'),
                    onDoubleTap: () => _printMsg('双击'),
                    onLongPress: () => _printMsg('长按'),
                    onTapCancel: () => _printMsg('取消点击'),
                    onTapUp: (e) => _printMsg('点击抬起'),
                    onTapDown: (e) => _printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        '点我',
                        style: TextStyle(fontSize: 20),
                      ),
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                    ),
                  ),
                  Text(printString),
                ],
              ),
              Positioned(
                // 跟着手指移动的小球
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _pan(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(36)),
                  ),
                ),

              ),
            ],
          ),
        ));
  }

  _pan(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
//    print(e);
  }

  _printMsg(String s) {
    setState(() {
      printString += ' ${s}';
    });
  }
}
