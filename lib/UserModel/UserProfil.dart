import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_flutter_pmu/UserModel/UserClass.dart';

import '../Database/mongodb.dart';
import '../NavBar.dart';
import '../main.dart';

class UserProfil extends StatefulWidget {
  const UserProfil({super.key});
  static const tag = "second_page";

import 'package:projet_flutter_pmu/mongodb.dart';

class UserProfil extends StatelessWidget {
  const UserProfil({super.key});

  static const tag = "second_page";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<UserProfil> createState() => _UserProfilState();
}

class _UserProfilState extends State<UserProfil> {
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var user;
  var horses;
  var horse;
  List<String> tabHorses = [];
  var FirstNameController = TextEditingController();
  var LastNameController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var AgeController = TextEditingController();
  var PhoneController = TextEditingController();
  var PictureController = TextEditingController();
  var FFEController = TextEditingController();
  var test = TextEditingController();
  var nameHorseController = TextEditingController();
  var pictureHorseController = TextEditingController();
  var ageHorseController = TextEditingController();
  var coatHorseController = TextEditingController();
  var breedHorseController = TextEditingController();
  var genderHorseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    user = MongoDatabase.getUserById().then((result) {

      //setState(() {
      user = result;
      FirstNameController.text = user['firstName'];
      LastNameController.text = user['lastName'];
      EmailController.text = user['email'];
      PasswordController.text = user['password'];
      AgeController.text = "${user['age']}";
      PhoneController.text = user['phone'];
      PictureController.text = user['picture'];
      FFEController.text = user['ffe'];
      // });

    });
    horse = MongoDatabase.getHorse().then((resultHorse) {
      horse = resultHorse;
      nameHorseController.text = horse['name'];
      pictureHorseController.text = horse["picture"];
      ageHorseController.text = "${user['age']}";
      coatHorseController.text = horse["coat"];
      breedHorseController.text = horse["breed"];
      genderHorseController.text = horse["gender"];
    });


    setState(() {
      horses = MongoDatabase.listHorses().then((resultHorses) {
        horses = resultHorses;
      });
    });


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
            )),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        /*actions: [
          IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => (MyHomePage(title: "Bonjour",))));
        }, icon: Icon(Icons.home)),
        ],*/
      ),
      bottomNavigationBar: generalBottomNavigationBar(context),


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: FirstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  icon: Icon(Icons.account_box),
                )),
            TextFormField(
                controller: LastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  icon: Icon(Icons.account_box),
                )),
            TextFormField(
                controller: EmailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                )),
            TextFormField(
                controller: PasswordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.password),
                )),
            TextFormField(
              controller: AgeController,
              decoration: const InputDecoration(
                labelText: 'Age',
                icon: Icon(Icons.calendar_today),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            TextFormField(
                controller: PhoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  icon: Icon(Icons.phone),
                )),
            TextFormField(
                controller: PictureController,
                decoration: const InputDecoration(
                  labelText: 'Image',
                  icon: Icon(Icons.image),
                )),
            /*Image.network(
                "${PictureController}",
                width:50
            ),*/
            TextFormField(
                controller: FFEController,
                decoration: const InputDecoration(
                  labelText: 'FFE',
                  icon: Icon(Icons.http),
                )),
           /* Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: horses[index]["owners"] == EmailController.text
                              ? Text(horses[index]["name"],
                                  style:
                                      TextStyle(backgroundColor: Colors.blue))
                              : Text(
                                  horses[index]["name"],
                                  style: TextStyle(backgroundColor: Colors.red),
                                ),
                        ),
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            popupHorse(index);
                          },
                        )
                      ],
                    ),
                  );
                },
                itemCount: 2,
              ),
            ),*/
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                MongoDatabase.updateUserById(FirstNameController.text, LastNameController.text, EmailController.text, PasswordController.text, int.parse(AgeController.text), PhoneController.text, PictureController.text, FFEController.text);
              },
              child: Text('Modifi??'),
            ),
          ],
        ),
      ),
    );
  }

  popupHorse(int index) {
    if (horses[index]["owners"] == EmailController) {
      AlertDialog alert = AlertDialog(
          title: Text(horses[index]["name"]),
          content: Column(
            children: [
              TextFormField(
                controller: nameHorseController,
              ),
              TextFormField(
                controller: pictureHorseController,
              ),
              TextFormField(
                controller: ageHorseController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              TextFormField(
                controller: coatHorseController,
              ),
              TextFormField(
                controller: breedHorseController,
              ),
              TextFormField(
                controller: genderHorseController,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  MongoDatabase.updateHorse(
                    horse[index]["name"],
                    nameHorseController.text,
                    pictureHorseController.text,
                    int.parse(ageHorseController.text),
                    coatHorseController.text,
                    breedHorseController.text,
                    genderHorseController.text,
                  );
                },
                child: Text('Modifi??'),
              ),
            ],
          ));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      AlertDialog alert = AlertDialog(
        title: Text(horses[index]["name"]),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
