import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';
import '../UserModel/UserClass.dart';

class MongoDatabase {
  static var db;

  static connect() async {
    db = await Db.create(MONGO_URL);
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
}
