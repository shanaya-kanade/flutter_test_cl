import 'package:flutter/material.dart';
import 'package:flutter_test_cl/models/profile.dart';

class ReorderedList extends StatefulWidget {
  @override
  ReorderedListState createState() => ReorderedListState();
}

class ReorderedListState extends State<ReorderedList> {
  List<String> _list = Profile.fetchItemsForReorderedList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 4.0),
        children: _list
            .map((item) => ListTile(
                  key: Key("$item"),
                  title: Text("$item"),
                  trailing: Icon(Icons.menu),
                ))
            .toList(),
        onReorder: (int start, int current) {
          // dragging from top to bottom
          if (start < current) {
            int end = current - 1;
            String startItem = _list[start];
            int i = 0;
            int local = start;
            do {
              _list[local] = _list[++local];
              i++;
            } while (i < end - start);
            _list[end] = startItem;
          }
          // dragging from bottom to top
          else if (start > current) {
            String startItem = _list[start];
            for (int i = start; i > current; i--) {
              _list[i] = _list[i - 1];
            }
            _list[current] = startItem;
          }
          setState(() {});
        },
      ),
    );
  }
}

//   _updateMyItems(oldIndex, newIndex) {
//     String old = reorderedListItems[oldIndex];
//           if (oldIndex > newIndex) {
//             for (int i = oldIndex; i > newIndex; i--) {
//               reorderedListItems[i] = reorderedListItems[i - 1];
//             }
//             reorderedListItems[newIndex] = old;
//           } else {
//             for (int i = oldIndex; i < newIndex - 1; i++) {
//               reorderedListItems[i] = reorderedListItems[i + 1];
//             }
//             reorderedListItems[newIndex - 1] = old;
//           }
//   }
// }
