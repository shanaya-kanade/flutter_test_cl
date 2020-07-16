import 'package:flutter/material.dart';
import 'package:flutter_test_cl/main.dart';
import 'package:flutter_test_cl/models/profile.dart';

class Profiles extends StatelessWidget {
  final profiles = Profile.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: profiles.length,
            itemBuilder: (BuildContext context, int index) {
              var profile = profiles[index];
              return ListTile(
                title: Text(profile.subjectName),
                onTap: () => _onProfileTap(context, profile.id),
              );
            }));
  }

  void _onProfileTap(BuildContext context, int profileId) {
    Navigator.pushNamed(context, ProfileDetailRoute,
        arguments: {"id": profileId});
  }
}
