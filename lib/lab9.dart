import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  final product = const [
    {'name': 'Shirt', 'price': '29.99'},
    {'name': 'Shoes', 'price': '49.99'},
    {'name': 'Hat', 'price': '15.99'},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Shop')),
    body: ListView.builder(
      itemCount: product.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(product[i]['name']!),
        subtitle: Text('\$${product[i]['price']}'),
        trailing: TextButton(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${product[i]['name']} added'))),
          child: Text('Add'),
        ),
      ),
    ),
  );
}

