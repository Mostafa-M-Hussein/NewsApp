class User {
  String name, profession;

  User(this.name, this.profession);
}

class Profile {
  User user;

  Profile( { this.user } );
}

class ProfileProvider {
  static Profile profile()
  {
    return Profile(user : User( "Erik Walters", "PhotoGraphy") );
  }
  static List<String> photos() {
    return List.generate(15, (index) {
      return ('assets/shared/avatar.jpg');
    });
  }

  static List<String> videos() {
    return List.generate(15, (index) {
      return ('assets/shared/avatar.jpg');
    });
  }

  static List<String> posts() {
    return List.generate(15, (index) {
      return ('assets/shared/avatar.jpg');
    });
  }

  static List<String> friends() {
    return List.generate(15, (index) {
      return ('assets/shared/avatar.jpg');
    });
  }



}
