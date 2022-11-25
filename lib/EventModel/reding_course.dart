import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:projet_flutter_pmu/EventModel/EventClass.dart';
import 'package:projet_flutter_pmu/UserModel/UserProfil.dart';

import '../Database/mongodb.dart';

class RidingCourses extends StatefulWidget {
  const RidingCourses({super.key});

  @override
  State<RidingCourses> createState() => _RidingCoursesState();
}

class Course extends Event {
  String Ground;
  String Discipline;
  String Duration;
  DateTime reservationDate;
  String reservationTime;
  Course(this.Ground, this.Discipline, this.Duration, this.reservationDate,
      this.reservationTime)
      : super('', [], '', '', '', '', '', '', []);
}

var NameController = TextEditingController();
const List<String> list = <String>[
  '08:00',
  '08:30',
  '09:00',
  '09:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '15:30',
  '16:00',
  '16:30',
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
  '19:30',
  '20:00'
];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Réserver un cours')),
        body: const Center(
          child: RidingCourses(),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

enum Ground { quarry, treadmill }

enum Duration { hour, halfHour }

enum Discipline { training, jumping, endurance }

var reservationDate = DateTime.now();

var reservationTime = "DateTime.now()";

/*var ground= Ground.values;

var discipline= Discipline.values;

var duration= Duration.values;*/

class _RidingCoursesState extends State<RidingCourses> {
  //Cette classe permet de modifier les valeurs des differentes variables relatives aux cours (Terrain, discipline, duree, date et heure)
  Discipline? _discipline = Discipline.endurance;
  Ground? _ground = Ground.quarry;
  Duration? _duration = Duration.halfHour;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )), systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: ListView(children: <Widget>[
          TextFormField(
            controller: NameController,
          ),
          Text("Discipline :"),
          ListTile(
            title: const Text('Dressage'),
            leading: Radio<Discipline>(
              value: Discipline.training,
              groupValue: _discipline,
              onChanged: (Discipline? value) {
                setState(() {
                  _discipline = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Saut d\'obstacle'),
            leading: Radio<Discipline>(
              value: Discipline.jumping,
              groupValue: _discipline,
              onChanged: (Discipline? value) {
                setState(() {
                  _discipline = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Endurance'),
            leading: Radio<Discipline>(
              value: Discipline.endurance,
              groupValue: _discipline,
              onChanged: (Discipline? value) {
                setState(() {
                  _discipline = value;
                });
              },
            ),
          ),
          Text("Terrain :"),
          ListTile(
            title: const Text('Carrière'),
            leading: Radio<Ground>(
              value: Ground.quarry,
              groupValue: _ground,
              onChanged: (Ground? value) {
                setState(() {
                  _ground = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Manège'),
            leading: Radio<Ground>(
              value: Ground.treadmill,
              groupValue: _ground,
              onChanged: (Ground? value) {
                setState(() {
                  _ground = value;
                });
              },
            ),
          ),
          Text("Durée :"),
          ListTile(
            title: const Text('1/2 heure'),
            leading: Radio<Duration>(
              value: Duration.halfHour,
              groupValue: _duration,
              onChanged: (Duration? value) {
                setState(() {
                  _duration = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('1 heure'),
            leading: Radio<Duration>(
              value: Duration.hour,
              groupValue: _duration,
              onChanged: (Duration? value) {
                setState(() {
                  _duration = value;
                });
              },
            ),
          ),
          Text("Date :"),
          FlutterCalendar(
              selectionMode: CalendarSelectionMode.single,
              onDayPressed: (DateTime date) {
                print(date);
                reservationDate = date;
              }),
          Text("Heure :"),
          DropdownButtonExample(),
          ElevatedButton(
            onPressed: () {
              // Cliquer sur le bouton envoie les valeurs des différentes variables en base de données et dans le terminal.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Un instant...')),
              );
              print(_ground);
              /*var GroundValue = _ground;
          var DisciplineValue = _discipline;
          var DurationValue = _duration;*/
              MongoDatabase.updateEvent(
                  NameController.text,
                  Ground.values,
                  Discipline.values,
                  Duration.values,
                  reservationDate,
                  reservationTime);

              /*print(Ground.values);
          print(_discipline);
          print(_duration);
          print(reservationDate);
          print(reservationTime);*/
            },
            child: //const Text('Submit'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext) => UserProfil()));
                  },
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;
//Cette classe permet de gerer le menu deroulant de selection d'horraire.
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          // print(this.dropdownValue);
          reservationTime = this.dropdownValue;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}