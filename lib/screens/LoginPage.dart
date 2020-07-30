import 'package:flutter_test_cl/utils/storageUtilities.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_cl/graphql/login_query.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String email;
  String password;
  String _userToken;

  @override
  void initState() {
    super.initState();
    _getUserToken();
  }

  _getUserToken() async {
    String userToken = await StorageUtlities.getStringValue('UserToken');
    setState(() {
      _userToken = userToken;
    });
  }

  LocalAuthentication auth = LocalAuthentication();

  // bool _canCheckBiometrics;
  // List<BiometricType> _availableBiometrics;
  String _authorized = "Not Authorized";
  bool _isAuthenticating = false;

  // Future<void> _checkBiometrics() async {
  //   bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }

  //   if (!mounted) return;
  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics;
  //   });
  // }

  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }

  //   setState(() {
  //     _availableBiometrics = availableBiometrics;
  //   });
  // }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });

      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);

      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? "Authorized" : "Not Authorized";
      Navigator.pushNamed(context, ProfilesRoute);
    });
  }

  void _cancelAuthentication() {
    try {
      auth.stopAuthentication();
    } catch (e) {
      print(e);
    }
  }

  setUserToken(userToken) async {
    StorageUtlities.setStringValue("UserToken", userToken);

    setState(() {
      _userToken = userToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    //bool isTokenAvailable = _userToken != null;
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
          children: <Widget>[
            emailField,
            passwordField,
            loginBtn,
            _userToken != null
                ? RaisedButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    child: Text(
                        _isAuthenticating ? 'Cancel' : 'Touch ID to Login'),
                    onPressed: _isAuthenticating
                        ? _cancelAuthentication
                        : _authenticate,
                  )
                : Container(
                    key: Key('4'),
                  )
          ],
        ),
      )),
    );
  }
}
