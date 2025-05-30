import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MaterialApp(home: WeatherApp()));
class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}
class _WeatherAppState extends State<WeatherApp> {
  final _c = TextEditingController();
  String _info = '';
  final _k = '0830225e3b25a0708dd3a3720b39f071'; // Replace with your key

  Future<void> _getW(String city) async {
    final u = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_k';
    try {
      final r = await http.get(Uri.parse(u));
      if (r.statusCode == 200) {
        final d = json.decode(r.body);
        final t = (d['main']['temp'] - 273.15).toStringAsFixed(1);
        final desc = d['weather'][0]['description'];
        setState(() => _info = '$city\n$t°C, $desc');
      } else setState(() => _info = 'Not found');
    } catch (e) {
      setState(() => _info = 'Error');
    }
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: _c, decoration: InputDecoration(hintText: 'City')),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () => _getW(_c.text), child: Text('Check')),
          SizedBox(height: 20),
          Text(_info, textAlign: TextAlign.center)
        ]),
      ),
    );
  }
}
