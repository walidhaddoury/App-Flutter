class User {
  String mail;
  String? firstName;
  String? lastName;
  String password;
<<<<<<< refs/remotes/origin/main
  String? picture;
  int? role;
  String? phone;
  int? age;
  String? ffe;
  List? horsesOwned;
  List? horseDP;
=======
  String picture;
  int role;
  String phone;
  int age;
  String ffe;
  List horsesOwned;
  List horseDP;
>>>>>>> modif int

  User({
    required this.mail,
    this.firstName,
    this.lastName,
    required this.password,
    this.picture,
    this.role,
    this.phone,
    this.age,
    this.ffe,
    this.horsesOwned,
    this.horseDP,
  });
}
