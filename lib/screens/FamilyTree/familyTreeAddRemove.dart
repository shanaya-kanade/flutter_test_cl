import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_cl/models/familyTreeModel.dart';

class FamilyTreeAddRemove extends StatefulWidget {
  FamilyTreeAddRemove({Key key}) : super(key: key);

  @override
  FamilyTreeAddRemoveState createState() => FamilyTreeAddRemoveState();
}

class FamilyTreeAddRemoveState extends State<FamilyTreeAddRemove> {
  FamilyDescription description = new FamilyDescription();

  void _gotoMainPage(BuildContext context) {
    Navigator.pop(context);
  }

  void _onAddDescription(BuildContext context) {
    var familyTreeModel = Provider.of<FamilyTreeModel>(context);
    familyTreeModel.add(description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Text('Name:'),
      TextField(
        onChanged: (text) => description.name = text,
      ),
      Text('Relationship'),
      TextField(
        onChanged: (text) => description.relationship = text,
      ),
      Row(children: <Widget>[
        MaterialButton(
          child: Text('Add'),
          onPressed: () => _onAddDescription(context),
        )
      ]),
      RaisedButton(
        child: Text("Go to Main Page"),
        onPressed: () => _gotoMainPage(context),
      )
    ]));
  }
}
