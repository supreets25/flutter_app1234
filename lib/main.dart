import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Image view",
        home: Application12());
  }
}

class Application12 extends StatefulWidget {
  @override
  _Application12State createState() => _Application12State();
}

class _Application12State extends State<Application12> {

  String ans = "0",operator,printVal = "0";
  int num1=0,num2=0;


  Widget customButton(String a){
    return Expanded(
      child: OutlineButton(
      onPressed: (){
        if(a=="C"){
          num1=num2=0;
          ans = "0";
        }else if(a=="+"||a=="-"||a=="*"||a=="/"){
          num1 = int.parse(printVal);
          ans = "";
          operator = a;
        }else if(a == "="){
          num2= int.parse(printVal);
          switch(operator){
            case "+":{
              ans = (num1+num2).toString();
              break;
            }
            case "-":{
              ans = (num1-num2).toString();
              break;
            }
            case "*":{
              ans = (num1*num2).toString();
              break;
            }
            case "/":{
              ans = (num1~/num2).toString();
              break;
            }
          }
        }else{
          ans = int.parse(printVal+a).toString();
        }
          setState(() {
            printVal = ans;
          });

      },
        padding: EdgeInsets.all(25),
      child: Text("$a",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black
        ),
      ),
    ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar Text",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[
  Expanded(child: Container(
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.bottomRight,
    child: Text("$printVal",
      style: TextStyle(

        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  ),
  Row(
      children: <Widget>[
        customButton("9"),
        customButton("8"),
        customButton("7"),
        customButton("+"),
  ],
  ),

  Row(
    children: <Widget>[
      customButton("6"),
      customButton("5"),
      customButton("4"),
      customButton("-"),
    ],
  ),

  Row(
    children: <Widget>[
      customButton("3"),
      customButton("2"),
      customButton("1"),
      customButton("*"),
    ],
  ),

  Row(
    children: <Widget>[
      customButton("C"),
      customButton("0"),
      customButton("="),
      customButton("/"),
    ],
  ),

      ],
      ),
    );
  }
}

