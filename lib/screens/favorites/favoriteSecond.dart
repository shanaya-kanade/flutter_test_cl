import 'package:flutter/material.dart';

class FavoriteSecond extends StatefulWidget {
  

  @override
  FavoriteSecondState createState() => FavoriteSecondState();
}

class FavoriteSecondState extends State<FavoriteSecond> {
  String valueFromTextBox;
TextEditingController textFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textFieldController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    valueFromTextBox = textFieldController.text;
    print("Second text field: ${textFieldController.text}");
  }

  

  @override
  void dispose() 
  {
    textFieldController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (text) {

            }
          ),
          TextField(
            controller: textFieldController
          ),
          RaisedButton(onPressed: () => {
            Navigator.pop(context, valueFromTextBox)
          },
          child: Text('Go Back')
          )

        ]
      )
       
    );
  }
}