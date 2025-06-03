import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main(){runApp(MaterialApp(home:Calculator()));}
class Calculator extends StatefulWidget{
  @override
  State <Calculator> createState()=>CalculatorApp();
}
class CalculatorApp extends State<Calculator>{
  String input=' ',result='0';
  final buttons=[
    '7','8','9','/',
    '4','5','6','*',
    '1','2','3','+',
    'AC','0','=','-',
  ];

  void onPress(String val){
    setState((){
      if(val=='AC'){
        input='';
        result='0';
      }else if(val=='='){
        try{
          result='${Parser().parse(input).evaluate(EvaluationType.REAL,ContextModel())}';
        }catch(_){
          result='Error';
        }
      }else{
        input+=val;
      }
    });
  }

  @override
  Widget build(BuildContext context)=>Scaffold(
    body:Center(
      child: SizedBox(
        width: 320,
        child: Column(
          children:[
            Expanded(
              flex:2,
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(input,style: TextStyle(fontSize: 20)),
                    Text(result,style:TextStyle(fontSize: 32,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex:5,
              child: GridView.count(
                crossAxisCount: 4,
                padding: EdgeInsets.all(12),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.2,
                children: buttons.map((b)=>ElevatedButton(
                onPressed:()=>onPress(b),
                style: ElevatedButton.styleFrom(
                     padding:EdgeInsets.all(16),
                     shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
            )
            ),
            child:Text(b,style: TextStyle(fontSize: 20)),
            ),
                ).toList(),
      ),
    ),
      ],
  ),
  ),
  ),
  );
}