import 'package:flutter/material.dart';
import 'ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shift',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: Text("Shift"),
          ),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Frontend(),
            ),
          ),
        ));
  }
}
