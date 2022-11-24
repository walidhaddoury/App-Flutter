import 'dart:developer';
import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:projet_flutter_pmu/UserModel/UserClass.dart';
import 'constant.dart';

var userCollection;
var horseCollection;

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    userCollection = db.collection(COLLECTION_NAME);
    horseCollection = db.collection(COLLECTION_HORSE);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
/*    var collection = db.collection("Horses");
    await collection.insertOne({
      "name": "Petit Poney",
      "picture": "picture",
      "age": 2,
      "coat": "rayé",
      "breed": "moitié australien, moitié africain",
      "gendre": "femelle",
      "owners": ["loic@mail.com", "walid@mail.com"],
    });*/
    //print(await collection.find().toList());
  }

  static getUserById() async {
    // var User = await userCollection.findOne(where.eq("_id", 'ObjectId("637e1c7597aa09342b883f49")'));

    var User = await userCollection.findOne(where.eq("age", 20));
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
    await userCollection.updateMany(where.eq("age", 20), modify.set("firstName", firstName));
    await userCollection.updateMany(where.eq("age", 20), modify.set("lastName", lastName));
    await userCollection.updateMany(where.eq("age", 20), modify.set("email", email));
    await userCollection.updateMany(where.eq("age", 20), modify.set("password", password));
    await userCollection.updateMany(where.eq("age", 20), modify.set("age", age));
    await userCollection.updateMany(where.eq("age", 20), modify.set("phone", phone));
    await userCollection.updateMany(where.eq("age", 20), modify.set("picture", picture));
    await userCollection.updateMany(where.eq("age", 20), modify.set("ffe", ffe));
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

    await horseCollection.updateOne(where.eq("name", nameForId), modify.set("name", name));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("picture", picture));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("age", age));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("coat", coat));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("breed", breed));
    await userCollection.updateMany(where.eq("name", nameForId), modify.set("gender", gender));

  }
}

