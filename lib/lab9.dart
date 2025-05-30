import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:Home()));
class Home extends StatelessWidget{
  final product=const[
    {'name':'Shoes','price':'29.99'},
    {'name':'Shirt','price':'56'},
    {'name':'hat','price':'37.8'}
  ];
  @override
    Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title:Text('Shop')),
    body:ListView.builder(
      itemCount:product.length,
      itemBuilder:(_,i)=>ListTile(
        title:Text(product[i]['name']!),
        subtitle:Text('\$${product[i]['price']}'),
        trailing:TextButton(
          onPressed:()=>ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text('${product[i]['name']} added'))),
            child:Text('Add')
      ),
      ),


    ),
  );
}