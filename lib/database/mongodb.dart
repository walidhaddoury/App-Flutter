import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection("Users");
    await collection.insertOne(
        {"username": "mp", "name": "Alexis", "mail": "loic@gmail.com"});
    print(await collection.find().toList());
  }
}