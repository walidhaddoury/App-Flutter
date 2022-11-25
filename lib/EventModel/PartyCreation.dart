import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:projet_flutter_pmu/EventModel/EventClass.dart';
import 'package:projet_flutter_pmu/mongodb.dart';

class PartyCreate extends StatefulWidget {
  const PartyCreate({super.key});

  @override
  State<PartyCreate> createState() => _PartyCreateState();
}

class Party extends Event {


  final UrlController = TextEditingController();

  DateTime Date;
  String PictureUrl;
  Party( this.Date,

      this.PictureUrl)
      : super('', [], '', '', '', '', '', '', []);
}


var UrlController = TextEditingController();
var AddressController = TextEditingController();
var Date = DateTime.now();


/*const List<String> list = <String>[
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
];*/

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Créer un concours')),
        body: const Center(
          child: PartyCreate(),
        ),
      ),
    );
  }
}

/*class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

enum Ground { quarry, treadmill }

enum Duration { hour, halfHour }

enum Discipline { training, jumping, endurance }*/



//var reservationTime = "DateTime.now()";

/*var ground= Ground.values;

var discipline= Discipline.values;

var duration= Duration.values;*/

class _PartyCreateState extends State<PartyCreate> {
  //Cette classe permet de modifier les valeurs des differentes variables relatives aux cours (Terrain, discipline, duree, date et heure)
  /*Discipline? _discipline = Discipline.endurance;
  Ground? _ground = Ground.quarry;
  Duration? _duration = Duration.halfHour;*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
          makeInput(label: "Address", controller: AddressController),
          makeInput(label: "Picture", controller:UrlController),
          Text("Date :"),
          FlutterCalendar(
              selectionMode: CalendarSelectionMode.single,
              onDayPressed: (DateTime date) {
                print(date);
                Date = date;
              }),

          ElevatedButton(
            onPressed: () {
              // Cliquer sur le bouton envoie les valeurs des différentes variables en base de données et dans le terminal.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Un instant...')),
              );
              //print(_ground);
              /*var GroundValue = _ground;
          var DisciplineValue = _discipline;
          var DurationValue = _duration;*/
              /*MongoDatabase.updateEvent(
                  NameController.text,
                  AddressController.text,
                  UrlController.text,
                  Date);*/
              //reservationTime);

              /*print(Ground.values);
          print(_discipline);
          print(_duration);
          print(reservationDate);
          print(reservationTime);*/
            },
            child: const Text('Submit'),
          ),
        ]));
  }
}

/*class _DropdownButtonExampleState extends State<DropdownButtonExample> {
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
}*/



Widget makeInput({label,controller, obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      const SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      const SizedBox(height: 30,)

    ],
  );
}