import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:projet_flutter_pmu/UserModel/UserClass.dart';
import 'constant.dart';

var userCollection;
class MongoDatabase {
  static var db;

  static connect() async {
    db = await Db.create(MONGO_URL);
    userCollection = db.collection(COLLECTION_NAME);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    /*var collection = db.collection(COLLECTION_NAME);
    await collection.insertOne(
        {"username": "mp", "name": "Alexis", "mail": "loic@gmail.com"});
    print(await collection.find().toList());*/
  }

  static Future<List<User>> getData() async {
    final arrData = await db.collection(COLLECTION_NAME).find().toList();
    List<User> listUsers = [];
    arrData.forEach((item) => listUsers.add(User(item['mail'], item['firstName'], item['lastName'], item['password'], item['picture'], item['role'], item['phone'], item['age'], item['ffe'], item['horsesOwned'], item['horseDP'])));
    return listUsers;
  }


  static getAllUser() async {
    var allUser = await userCollection.findOne();
    print(allUser);
    return allUser;
}
}
