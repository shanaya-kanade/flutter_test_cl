import 'package:flutter/material.dart';
import 'package:flutter_test_cl/screens/favorites/favoriteSecond.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key key}) : super(key: key);

  @override
  FavoriteWidgetState createState() => FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;

  List<String> _favoriteMoviesList = [
    'Movie1',
    'Movie2',
    'Movie3',
    'Movie4',
    'Movie5',
    'Movie6',
    'Movie7',
    'Movie8',
    'Movie9',
    'Movie10'
  ];

  List<DropdownMenuItem<String>> _favoriteMovies = new List();
  String _selectedMovie = 'Movie1';
  String _movieFromSecondScreen = 'Not set yet';

  @override
  void initState() {
    _movieFromSecondScreen = "Something";
    for (String movie in _favoriteMoviesList) {
      _favoriteMovies
          .add(new DropdownMenuItem(child: Text(movie), value: movie));
    }
    super.initState();
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF167F67),
        title: Text(
          'Favorite Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Text('My favorite movies are:',
                  style: Theme.of(context).textTheme.headline6),
              Text(_selectedMovie,
                  style: Theme.of(context).textTheme.bodyText1),
              SizedBox(height: 10),
              Text('From Second Screen:',
                  style: Theme.of(context).textTheme.headline6),
              Text(_movieFromSecondScreen,
                  style: Theme.of(context).textTheme.bodyText1),
              IconButton(
                icon:
                    _isFavorite ? Icon(Icons.star) : Icon(Icons.account_circle),
                onPressed: _toggleFavorite,
              )
            ],
          ),
        ),
        DropdownButton<String>(
          hint: Text("Select item"),
          value: _selectedMovie,
          onChanged: (String value) {
            setState(() {
              _selectedMovie = value;
            });
          },
          items: _favoriteMoviesList.map((String user) {
            return DropdownMenuItem<String>(
              value: user,
              child: Row(
                children: <Widget>[
                  //user.icon,
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    user,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        RaisedButton(
            child: Text('Go to second screen'),
            onPressed: () => _awaitReturnValueFromSecondScreen(context))
      ]),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoriteSecond(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      _movieFromSecondScreen = result != null ? result : 'Whatever';
    });
  }

  void onChangedMovie(String selectedMovie) {
    _selectedMovie = selectedMovie;
  }
}
