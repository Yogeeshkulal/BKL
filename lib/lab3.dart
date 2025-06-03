import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:loginApp()));
class loginApp extends StatefulWidget{
  @override
  State <loginApp> createState()=> loginAppState();
}
class loginAppState extends State<loginApp>{
  final u=TextEditingController(),p=TextEditingController();
  @override
  Widget build(BuildContext context)=>Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,children: [
          TextField(controller: u,decoration: InputDecoration(hintText: 'user name')),
          TextField(controller: p,obscureText:true,decoration: InputDecoration(hintText: 'password')),
        TextButton(onPressed:(){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reset link sent')));
        },child: Text('Forgot Password')),
          ElevatedButton(onPressed:(){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Login Succesful')));
          },child:Text('Login')),
      ],
  ),
  ),
  );
}