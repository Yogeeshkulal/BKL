import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MaterialApp(home: WeatherApp()));
class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}
class _WeatherAppState extends State<WeatherApp> {
  final _controller = TextEditingController();
  String _result = '';
  final _apiKey = '0830225e3b25a0708dd3a3720b39f071'; // Replace with your key
  Future<void> _fetchWeather() async {
    final city = _controller.text;
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey';
    try {
      final res = await http.get(Uri.parse(url));
      final data = json.decode(res.body);
      if (res.statusCode == 200) {
        final temp = (data['main']['temp'] - 273.15).toStringAsFixed(1);
        final desc = data['weather'][0]['description'];
        setState(() => _result = '$city\n$temp°C, $desc');
      } else {
        setState(() => _result = 'City not found');
      }
    } catch (_) {
      setState(() => _result = 'Error');
    }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Weather')),
    body: Center(
    child: Column(
        children: [
          TextField(controller: _controller, decoration: InputDecoration(hintText: 'Enter city')),
          SizedBox(height: 10),
          ElevatedButton(onPressed: _fetchWeather, child: Text('Check')),
          SizedBox(height: 20),
          Text(_result, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
