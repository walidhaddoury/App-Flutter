class User {
  String mail;
  String? firstName;
  String? lastName;
  String password;
  String picture;
  int role;
  String phone;
  int age;
  String ffe;
  List horsesOwned;
  List horseDP;


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
