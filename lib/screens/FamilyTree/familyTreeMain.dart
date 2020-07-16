import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_cl/models/familyTreeModel.dart';
import 'package:flutter_test_cl/screens/FamilyTree/familyTreeAddRemove.dart';

class FamilyTree extends StatefulWidget {
  FamilyTree({Key key}) : super(key: key);

  @override
  FamilyTreeState createState() => FamilyTreeState();
}

class FamilyTreeState extends State<FamilyTree> {
  void _gotoAddRemovePage(BuildContext context) {
    //Navigator.pushNamed(context, FamilyTreeAddRemoveScreen);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FamilyTreeAddRemove()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Consumer<FamilyTreeModel>(
          builder: (context, model, child) => Column(children: <Widget>[
                SizedBox(
                    height: 200.0,
                    child: DataTable(
                        columns: [
                          DataColumn(label: Text("Name"), numeric: false),
                          DataColumn(
                              label: Text("Relationship"), numeric: false)
                        ],
                        rows: model.items
                            .map((familyDescription) => DataRow(cells: [
                                  DataCell(Text(familyDescription.name)),
                                  DataCell(Text(familyDescription.relationship))
                                ]))
                            .toList())),
                RaisedButton(
                  child: Text("Go to Add screen"),
                  onPressed: () => _gotoAddRemovePage(context),
                )
              ]))
    ]));
  }
}
