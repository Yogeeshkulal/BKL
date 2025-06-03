import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:Animatedlogo()));
class Animatedlogo extends StatefulWidget{
  @override
  State <Animatedlogo> createState()=>animatedlogostate();
}
class animatedlogostate extends State<Animatedlogo> with SingleTickerProviderStateMixin{
  late final AnimationController controller;
  late final Animation<Offset> animation;
  @override
  void initState(){
    super.initState();
    controller=AnimationController(vsync:this,duration:Duration(seconds: 2));
    animation=Tween(begin:Offset.zero ,end: Offset(0,-2))
        .animate(
      CurvedAnimation(parent: controller,curve:Curves.easeInOut),
    );
    controller.repeat(reverse: true);
  }
  @override
 void dispose(){
    controller.dispose();
    super.dispose();
 }
 @override
 Widget build(BuildContext context)=>Scaffold(
   body: Center(child: SlideTransition(position: animation,child:FlutterLogo(size: 100))),
 );


}