import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';

class RidingCourses extends StatefulWidget {
  const RidingCourses({super.key});

  @override
  State<RidingCourses> createState() => _RidingCoursesState();
}

enum Ground { quarry, treadmill }

enum Duration { hour, halfHour }

enum Discipline { training, jumping, endurance }

// bool CurrentState = true;

class _RidingCoursesState extends State<RidingCourses> {
  //CurrentState!;
  Discipline? _discipline = Discipline.endurance;
  Ground? _ground = Ground.quarry;
  Duration? _duration = Duration.halfHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          Expanded(
            child: SingleChildScrollView(),
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
                }
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                //if (_RidingCoursesState.CurrentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
              ,
              child: const Text('Submit'),
            ),
          )]));
  }
}


