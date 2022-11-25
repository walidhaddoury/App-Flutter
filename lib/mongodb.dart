import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

var EventCollection;

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    EventCollection = db.collection(COLLECTION_EVENT);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    /*var collection = db.collection("Users");
    await collection.insertOne(
        {"username": "mp", "name": "Alexis", "mail": "loic@gmail.com"});
    print(await collection.find().toList()
    );
    print(collection);*/
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
}}
