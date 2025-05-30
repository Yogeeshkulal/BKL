import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  home:Home(),
  routes:{'/details':(_)=>Details()},
));
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/details'),
                child:Text('Go to details'),
          ),
        ),
  );
}
class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title:Text('Home')),
    body:Center(
      child: ElevatedButton(
        onPressed:()=>Navigator.pop(context),
        child:Text('Back')
      ),
    ),
  );
}

