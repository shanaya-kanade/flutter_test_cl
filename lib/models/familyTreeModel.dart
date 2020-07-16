import 'dart:collection';

import 'package:flutter/material.dart';

class FamilyTreeModel extends ChangeNotifier {
  final List<FamilyDescription> _items = [];

  void add(FamilyDescription desc) {
    _items.add(desc);
    notifyListeners();
  }

  UnmodifiableListView<FamilyDescription> get items =>
      UnmodifiableListView(_items);

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  void remove(FamilyDescription desc) {
    _items.remove(desc);
    notifyListeners();
  }
}

class FamilyDescription {
  String name;
  String relationship;
}
