import 'package:flutter/material.dart';
import 'package:flutter_test_cl/screens/counterWithBloc/counter_bloc.dart';
import 'package:flutter_test_cl/screens/counterWithBloc/counter_event.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {
  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(
                children: <Widget>[
                  Text('You have pushed the button so many times'),
                  Text('${snapshot.data}'),
                ],
              );
            },
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
              heroTag: "btn3",
              onPressed: () => bloc.counterEventSink.add(IncrementEvent()),
              child: Icon(Icons.add)),
          FloatingActionButton(
              heroTag: "btn4",
              onPressed: () => bloc.counterEventSink.add(DecrementEvent()),
              child: Icon(Icons.remove)),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
