import 'package:flutter/material.dart';
import 'package:flutter_test_cl/screens/charts/groupedBarChart.dart';
import 'package:flutter_test_cl/screens/charts/pieChart.dart';
import 'package:flutter_test_cl/screens/charts/scatterPlotChart.dart';
import 'package:flutter_test_cl/screens/charts/simpleChart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainChart extends StatefulWidget {
  @override
  MainChartState createState() {
    return MainChartState();
  }
}

class MainChartState extends State<MainChart> {
  int _selectedIndex = 0;
  String headerText = "Bar Chart";

  static List<Widget> _widgetOptions = <Widget>[
    SimpleBarChart(),
    GroupedStackedBarChart(),
    SimplePieChart(),
    SimpleScatterPlotChart()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          headerText = "Bar Chart 1";
          break;
        case 1:
          headerText = "Stacked Bar Chart";
          break;
        case 2:
          headerText = "Pie Chart";
          break;
        case 3:
          headerText = "Scatter Plot";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(headerText)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
              icon: Icon(FontAwesomeIcons.bars),
              title: Text(
                '',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bars),
              title: Text(
                'Test',
                //style: TextStyle(color: Colors.red),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plusCircle),
              title: Text(
                'Pie Chart',
                style: TextStyle(color: Colors.red),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.arrowAltCircleDown),
              title: Text(
                'Scatter Plot',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
          onTap: _onItemTapped,
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)));
  }
}
