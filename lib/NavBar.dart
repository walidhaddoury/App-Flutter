import 'package:flutter/material.dart';
import 'package:projet_flutter_pmu/UserModel/UserProfil.dart';
import 'package:projet_flutter_pmu/main.dart';

import 'EventModel/reding_course.dart';

Widget generalBottomNavigationBar(BuildContext context){
  int index=0;


  return BottomNavigationBar(
    unselectedItemColor: Colors.blueAccent,
    currentIndex: index,
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil'),

      BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Event'),
      BottomNavigationBarItem(
          icon: Icon(Icons.monitor),
          label: 'Profil')
    ],onTap: (value){
    switch(value){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => (MyHomePage(title: "Bonjour",))));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => RidingCourses()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => UserProfil()));
        break;
    }

  },


  );

}