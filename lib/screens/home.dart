import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_test_cl/main.dart';
import 'package:flutter_test_cl/models/profile.dart';
import 'package:flutter_test_cl/screens/profiles/profiles.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final profiles = Profile.fetchAll();

  int _selectedIndex = 0;
  String headerText = "Profiles";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Profiles(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: Facebook',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          headerText = "Profiles";
          break;
        case 1:
          headerText = "Business";
          break;
        case 2:
          headerText = "Facebook";
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
              icon: Icon(FontAwesomeIcons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.businessTime),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.facebookMessenger),
              title: Text('Facebook messenger'),
            )
          ],
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
            child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Shilpi Kanade"),
            accountEmail: Text("skanade@customerlobby.com"),
            currentAccountPicture: GestureDetector(
                onTap: () => _onProfileTap(context, 1),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Shanaya.jpg'),
                    radius: 30.0)),
          ),
          ListTile(
            onTap: () => _onProfileTap(context, 1),
            leading: Icon(Icons.announcement),
            title: Text('About me'),
          ),
          ListTile(
            onTap: () => _onProfileTap(context, 2),
            leading: Icon(Icons.assignment_ind),
            title: Text('Details About me'),
          ),
          ListTile(
            onTap: () => _onProfileTap(context, 3),
            leading: Icon(Icons.cake),
            title: Text('Life Events'),
          ),
          ListTile(
              onTap: () => _onFavoriteTap(context),
              leading: Icon(FontAwesomeIcons.list),
              title: Text('Favorite')),
          ListTile(
              onTap: () => _onReorderTap(context),
              leading: Icon(FontAwesomeIcons.list),
              title: Text('Reorder List')),
          ListTile(
              onTap: () => _onTabbedPageTap(context),
              leading: Icon(FontAwesomeIcons.list),
              title: Text('Tabbed Page')),
          ListTile(
              onTap: () => _onBarChartTap(context),
              leading: Icon(FontAwesomeIcons.list),
              title: Text('Charts')),
          ListTile(
              onTap: () => _onCounterWithoutBloc(context),
              leading: Icon(FontAwesomeIcons.list),
              title: Text('Counter Without Bloc')),
          ListTile(
              onTap: () => _onCounterWithBloc(context),
              leading: Icon(FontAwesomeIcons.list),
              title: Text('Counter With Bloc')),
          ListTile(
              onTap: () => _onFamilyTree(context),
              leading: Icon(FontAwesomeIcons.list),
              title: Text('Family Tree')),
          Divider(),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ))
        ])),
        // body: ListView(
        //   children: profiles
        //       .map((profile) => GestureDetector(
        //             child: Text(profile.subjectName),
        //             onTap: () => _onProfileTap(context, profile.id),
        //           ))
        //       .toList(),
        // ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)));
  }

  void _onProfileTap(BuildContext context, int profileId) {
    Navigator.pushNamed(context, ProfileDetailRoute,
        arguments: {"id": profileId});
  }

  void _onFavoriteTap(BuildContext context) {
    Navigator.pushNamed(context, Favorite);
  }

  void _onReorderTap(BuildContext context) {
    Navigator.pushNamed(context, Reorder);
  }

  void _onTabbedPageTap(BuildContext context) {
    Navigator.pushNamed(context, TabbedPage);
  }

  void _onBarChartTap(BuildContext context) {
    Navigator.pushNamed(context, Charts);
  }

  void _onCounterWithoutBloc(BuildContext context) {
    Navigator.pushNamed(context, CounterWithoutBloc);
  }

  void _onCounterWithBloc(BuildContext context) {
    Navigator.pushNamed(context, CounterWithBloc);
  }

  void _onFamilyTree(BuildContext context) {
    Navigator.pushNamed(context, FamilyTreeScreen);
  }
}
