import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_test_cl/graphql/GraphQLConfiguration.dart';
import 'package:flutter_test_cl/graphql/login_query.dart';
import 'package:flutter_test_cl/screens/FamilyTree/familyTreeAddRemove.dart';
import 'package:flutter_test_cl/screens/FamilyTree/familyTreeMain.dart';
import 'package:flutter_test_cl/screens/LoginPage.dart';
import 'package:flutter_test_cl/screens/ReorderedList/reorderedList.dart';
import 'package:flutter_test_cl/screens/Tabs/MainTab.dart';
import 'package:flutter_test_cl/screens/charts/mainChart.dart';
import 'package:flutter_test_cl/screens/counterWithBloc/counterScreen.dart';
import 'package:flutter_test_cl/screens/counterWithBloc/counterScreenWithoutBloc.dart';
import 'package:flutter_test_cl/screens/favorites/favoritePage.dart';
import 'package:flutter_test_cl/screens/home.dart';
import 'package:flutter_test_cl/screens/profile_detail/profile_detail.dart';
import 'package:flutter_test_cl/style.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql/GraphQLConfiguration.dart';
import 'models/familyTreeModel.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
// void main() => runApp(GraphQLProvider(
//       client: graphQLConfiguration.client,
//       child: CacheProvider(child: MyApp()),
//     ));

void main() => runApp(MyApp());

const ProfilesRoute = '/profiles';
const Login = '/';
const ProfileDetailRoute = '/profile_detail';
const Favorite = '/favorite';
const Reorder = '/reorderedList';
const TabbedPage = '/maintab';
const Charts = '/charts';
const CounterWithoutBloc = '/counterWithoutBloc';
const CounterWithBloc = '/counterWithBloc';
const FamilyTreeScreen = '/familyTreeScreen';
const FamilyTreeAddRemoveScreen = '/familyTreeAddRemove';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return GraphQLProvider(
        child: ChangeNotifierProvider(
            create: (context) => FamilyTreeModel(),
            child: MaterialApp(
                title: 'This is my first Flutter App',
                //home: ProfileDetail(),
                onGenerateRoute: _routes(),
                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      textTheme: TextTheme(headline6: AppBarTextStyle),
                    ),
                    textTheme: TextTheme(
                        bodyText1: Body1TextStyle,
                        headline6: TitleTextStyle)))),
        client: graphqlClient);
  }
}

RouteFactory _routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case ProfilesRoute:
        screen = Home();
        break;
      case ProfileDetailRoute:
        screen = ProfileDetail(arguments["id"]);
        break;
      case Favorite:
        screen = FavoriteWidget();
        break;
      case Reorder:
        screen = ReorderedList();
        break;
      case Login:
        screen = LoginPage();
        break;
      case TabbedPage:
        screen = MainTab();
        break;
      case Charts:
        screen = MainChart();
        break;
      case CounterWithoutBloc:
        screen = CounterScreenWithoutBloc();
        break;
      case CounterWithBloc:
        screen = CounterScreen();
        break;
      case FamilyTreeScreen:
        screen = FamilyTree();
        break;
      case FamilyTreeAddRemoveScreen:
        screen = FamilyTreeAddRemove();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
