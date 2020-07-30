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
        appBar: AppBar(
          backgroundColor: const Color(0xFF167F67),
          title: Text(
            'Counter Screen With Bloc',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 32.0, 15.0, 4.0),
                    child: Text("# of times data pushed",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  //Text('You have pushed the button so many times'),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 32.0, 15.0, 4.0),
                    child: Text('${snapshot.data}',
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  //Text('${snapshot.data}'),
                ],
              );
            },
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
              key: Key('AddButton1'),
              heroTag: "btn3",
              onPressed: () => bloc.counterEventSink.add(IncrementEvent()),
              child: Icon(Icons.add)),
          FloatingActionButton(
              key: Key('RemoveButton1'),
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
