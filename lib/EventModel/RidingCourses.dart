import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';

class RidingCourses extends StatefulWidget {
  const RidingCourses({super.key});

  @override
  State<RidingCourses> createState() => _RidingCoursesState();
}



const List<String> list = <String>['08:00', '08:30', '09:00', '09:30','10:00', '10:30', '11:00', '11:30','12:00', '12:30', '13:00', '13:30','14:00', '14:30', '15:00', '15:30','16:00', '16:30', '17:00', '17:30','18:00', '18:30', '19:00', '19:30','20:00'];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: const Center(
          child: DropdownButtonExample(),
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

var reservationDate= DateTime.now();

var reservationTime= "DateTime.now()";


// bool CurrentState = true;

class _RidingCoursesState extends State<RidingCourses> {
  //CurrentState!;
  Discipline? _discipline = Discipline.endurance;
  Ground? _ground = Ground.quarry;
  Duration? _duration = Duration.halfHour;
  //String? _DropdownMenuItem = DropdownButtonApp();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[

          /*Row(
        children: <Widget>[*/
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
          /*],
      ),
          Row(
            children: <Widget>[*/
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
          /*],
          ),
          Row(
            children: <Widget>[*/
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
          /* ],
          ),*/
          Text("Date :"),
          FlutterCalendar(
              selectionMode: CalendarSelectionMode.single,
              onDayPressed: (DateTime date) {
                print(date);
                reservationDate = date;
              }
          ),
          Text("Heure :"),
          DropdownButtonExample(),




          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              //if (_RidingCoursesState.CurrentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
              print(_ground) ;
              print(_discipline) ;
              print(_duration) ;
              print(reservationDate) ;
              print(reservationTime);
            }
            ,
            child: const Text('Submit'),
          ),
        ]));
  }
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

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
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          print(this.dropdownValue);
          reservationTime = this.dropdownValue;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
        //print(this.value);
      }).toList(),
    );
  }
}


