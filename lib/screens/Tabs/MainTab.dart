import 'package:flutter/material.dart';
import 'package:flutter_test_cl/screens/Tabs/FirstTab.dart';
import 'package:flutter_test_cl/screens/Tabs/SecondTab.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.lightBlue,
                  tabs: [
                Tab(child: Text('Tab 1')),
                Tab(child: Text('Tab 2')),
                Tab(child: Text('Tab 3')),
                Tab(child: Text('Tab 4')),
                Tab(child: Text('Tab 5')),
                Tab(child: Text('Tab 6')),
                Tab(child: Text('Tab 7')),
                Tab(child: Text('Tab 8'))
              ])),
          body: TabBarView(
            children: <Widget>[
              FirstTab(),
              SecondTab(),
              FirstTab(),
              FirstTab(),
              FirstTab(),
              SecondTab(),
              SecondTab(),
              SecondTab()
            ],
          ),
        ));
  }
}
