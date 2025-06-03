import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:CounterApp()));
class CounterApp extends StatefulWidget{
  @override
  State <CounterApp> createState()=>CounterAppState();
}
class CounterAppState extends State<CounterApp>{
  int _counter=0;
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title: Text('Counter App')),
    body:Center(
      child: Column(
       mainAxisSize: MainAxisSize.min,children: [
         Text('$_counter',style: TextStyle(fontSize: 50)),
        Row(
          mainAxisSize: MainAxisSize.min,children: [
            ElevatedButton(onPressed:(){
              if(_counter>0) setState(()=>_counter--);
            },child: Text('-')),
          SizedBox(width: 20),
          ElevatedButton(onPressed:(){
            setState(()=>_counter++);
          },child:Text('+')),
        ],
        ),
      ],
      ),
    ),
  );
}