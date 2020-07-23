import 'package:flutter/material.dart';

class CounterScreenWithoutBloc extends StatefulWidget {
  CounterScreenWithoutBloc({Key key}) : super(key: key);

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreenWithoutBloc> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fb1 = FloatingActionButton(
        key: Key('AddButton'),
        heroTag: "btn1",
        onPressed: _incrementCounter,
        child: Icon(Icons.add));

    final fb2 = FloatingActionButton(
        key: Key('RemoveButton'),
        heroTag: "btn2",
        onPressed: _decrementCounter,
        child: Icon(Icons.remove));
    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text('You have pushed the button so many times'),
              Text('$_counter'),
            ],
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          fb1,
          fb2,
        ]));
  }
}
