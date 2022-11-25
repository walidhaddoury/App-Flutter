import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

var horseCollection;
var userCollection;
var EventCollection;

class MongoDatabase {
  static var db;

  static connect() async {
    db = await Db.create(MONGO_URL);
    userCollection = db.collection(COLLECTION_NAME);
    horseCollection = db.collection(COLLECTION_HORSE);
    EventCollection = db.collection(COLLECTION_EVENT);
    await db.open();
    inspect(db);
  }

  static createUser(String mail, String password) async {
    Map<String, dynamic> newUser = {
      "mail": mail,
      "password": password,
    };

    var collection = db.collection('Users');
    print("==========REQUETE ADD USER==============");
    await collection.insertOne(newUser);
  }

  static getUser(String mail) async {
    var collection = db.collection('Users');
    var userFound = await collection.findOne(where.eq('mail', mail));

    return userFound;
  }

  static getUserById() async {
    // var User = await userCollection.findOne(where.eq("_id", 'ObjectId("637e1c7597aa09342b883f49")'));

    var User = await userCollection.findOne(where.eq("email", "walid@walid.fr"));
    return User;
  }

  static updateUserById(
      String firstName,
      String lastName,
      String email,
      String password,
      int age,
      String phone,
      String picture,
      String ffe) async {
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("firstName", firstName));
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("lastName", lastName));
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("email", email));
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("password", password));
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("age", age));
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("phone", phone));
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("picture", picture));
    await userCollection.updateMany(where.eq("email", "walid@walid.fr"), modify.set("ffe", ffe));
  }

  static listHorses() async {
    var allHorses = await horseCollection.find().toList();
    return allHorses;
  }

  static getHorse() async {
    var horse = await horseCollection.findOne(where.eq("name", "Petit Tonerre"));
    return horse;
  }

  static updateHorse(String nameForId, String name, String picture, int age, String coat, String breed, String gender) async {

    await horseCollection.updateMany(where.eq("name", nameForId), modify.set("name", name));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("picture", picture));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("age", age));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("coat", coat));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("breed", breed));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("gender", gender));

  }

  static updateEvent(String Name, List Ground, List Discipline, List Duration, DateTime reservationDate, String reservationTime) async {
    var Event = await EventCollection.insertOne({
      "Name": Name,
      "Ground": Ground,
      "Discipline": Discipline,
      "Duration": Duration,
      "reservationDate": reservationDate,
      "reservationTime": reservationTime});
    print(Event);
    return Event;
  }
}
