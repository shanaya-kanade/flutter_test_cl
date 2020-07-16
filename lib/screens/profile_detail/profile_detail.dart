import 'package:flutter/material.dart';
import 'package:flutter_test_cl/models/profile.dart';
import 'package:flutter_test_cl/screens/profile_detail/image_banner.dart';
import 'package:flutter_test_cl/screens/profile_detail/text_section.dart';

class ProfileDetail extends StatelessWidget {
  final int _profileId;

  ProfileDetail(this._profileId);

  Widget build(BuildContext context) {
    final profile = Profile.fetchProfileById(_profileId);

    return Scaffold(
        appBar: AppBar(title: Text(profile.subjectName)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(profile.imagePath),
          ]..addAll(textSections(profile)),
        ));
  }

  List<Widget> textSections(Profile profile) {
    return profile.profileFacts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
