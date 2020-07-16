import 'package:flutter_test_cl/models/profile_fact.dart';

class Profile {
  final int id;
  final String subjectName;
  final String imagePath;
  final List<ProfileFact> profileFacts;

  Profile(this.id, this.subjectName, this.imagePath, this.profileFacts);

  static Profile fetchProfileById(int id) {
    List<Profile> profiles = Profile.fetchAll();

    for (int i = 0; i <= profiles.length; i++)
      if (profiles[i].id == id) {
        return profiles[i];
      }
    return null;
  }

  static List<Profile> fetchAll() {
    return [
      Profile(1, "About", "assets/images/Pic1.jpg", [
        ProfileFact(
            'Overview', 'Software Development Manager at Customer Lobby'),
        ProfileFact('Lives in', 'Denver, CO, USA'),
        ProfileFact('Studied At',
            'Bachelor of Engineering(Computer Science) at Pune University and IT Project Management from Boston University')
      ]),
      Profile(2, "Details About Me", "assets/images/Pic2.jpg", [
        ProfileFact(
            'Favorite Quote',
            'Imperfection is beauty, madness is genius and it'
                's better to be absolutely ridiculous than absolutely boring. ~ Marilyn Monroe'),
      ]),
      Profile(3, "Life Events", "assets/images/Pic3.jpg", [
        ProfileFact('Married', 'To: Sachin Kanade \nYear: 2016'),
        ProfileFact('First Child', 'Son: Aarya born in 2004'),
        ProfileFact('Second Child', 'Daughter: Arhana born in 2006')
      ]),
    ];
  }

  static List<String> fetchItemsForReorderedList() {
    return ['Tile 1', 'Tile 2', 'Tile 3', 'Tile 4', 'Tile 5'];
  }
}
