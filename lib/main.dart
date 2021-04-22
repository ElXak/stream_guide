import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller = StreamController<double>.broadcast();
  StreamSubscription<double> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                color: Colors.yellow,
                child: Text('Subscribe'),
                onPressed: () async {
                  getDelayedRandomValue().listen((value) {
                    print('Value from manualStream: $value}');
                  });
                },
              ),
              MaterialButton(
                color: Colors.blue[200],
                child: Text('Emit Value'),
                onPressed: () {
                  controller.add(12);
                },
              ),
              MaterialButton(
                color: Colors.red[200],
                child: Text('Unsubscribe'),
                onPressed: () {
                  streamSubscription.cancel();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<double> getDelayedRandomValue() async* {
    Random random = Random();

    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
}
