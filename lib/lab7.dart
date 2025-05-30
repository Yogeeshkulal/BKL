import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: StopwatchApp()));
class StopwatchApp extends StatefulWidget {
  @override
  State<StopwatchApp> createState() => _StopwatchAppState();
}
class _StopwatchAppState extends State<StopwatchApp> {
  final _sw = Stopwatch();
  late final Timer _t;
  String _time = '00:00:00';
  @override
  void initState() {
    super.initState();
    _t = Timer.periodic(Duration(milliseconds: 100), (_) {
      if (_sw.isRunning) {
        final ms = _sw.elapsedMilliseconds;
        setState(() => _time =
        '${(ms ~/ 60000).toString().padLeft(2, '0')}:'
            '${((ms ~/ 1000) % 60).toString().padLeft(2, '0')}:'
            '${((ms ~/ 10) % 100).toString().padLeft(2, '0')}');
      }
    });
  }
  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }
  Widget b(String t, VoidCallback? f) =>
      ElevatedButton(onPressed: f, child: Text(t));
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(_time, style: TextStyle(fontSize: 40)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          b('Start', _sw.isRunning ? null : () => setState(_sw.start)),
          b('Stop', _sw.isRunning ? () => setState(_sw.stop) : null),
          b('Reset', () => setState(() {
            _sw.reset();
            _time = '00:00:00';
          }))
        ])
      ]),
    ),
  );
}
