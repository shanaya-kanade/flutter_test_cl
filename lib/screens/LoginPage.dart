import 'package:flutter/foundation.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_cl/graphql/login_query.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String email;
  String password;

  setUserToken(userToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', userToken);
  }

  @override
  Widget build(BuildContext context) {
    final emailField = Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          obscureText: false,
          onChanged: (text) {
            email = text;
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        ));
    final passwordField = Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          obscureText: true,
          onChanged: (text) {
            password = text;
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        ));

    final loginBtn = Mutation(
      options: MutationOptions(
        documentNode:
            gql(loginMutation), // this is the mutation string you just created
        // you can update the cache based on results
        update: (Cache cache, QueryResult result) {
          return cache;
        },
        // or do something with the result.data on completion
        onCompleted: (dynamic resultData) {
          print(resultData);
          print(resultData["login"]["authenticated"]);
          if (resultData["login"]["authenticated"] == true) {
            setUserToken(resultData["login"]["token"]);
            Navigator.pushNamed(context, ProfilesRoute);
          }
        },
      ),
      builder: (
        RunMutation runMutation,
        QueryResult result,
      ) {
        return Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xff01A0C7),
            child: MaterialButton(
              minWidth: 300, //MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () => {
                print(email),
                print(password),
                runMutation({'email': email, 'password': password})
              },
              child: Text(
                "Login",
                textAlign: TextAlign.center,
              ),
            ));
      },
    );

    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[emailField, passwordField, loginBtn],
        ),
      )),
    );
  }
}
