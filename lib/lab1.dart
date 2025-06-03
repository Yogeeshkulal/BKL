import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,));
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title: Text('My app')),
    body:Center(
      child: Text("hello world",style:TextStyle(fontSize: 40,color: Colors.red),
    ),
  ),
  );
}
