import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller = StreamController();
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
                onPressed: () {
                  // Stream the controller manager
                  Stream stream = controller.stream;
                  streamSubscription = stream.listen((value) {
                    print('Value from the controller: $value');
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
}
