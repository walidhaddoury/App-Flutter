import 'package:flutter/material.dart';

import 'UserModel/login.dart';
import 'UserModel/register.dart';
import 'Database/mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'register': (context) => const Register(),
        'login': (context) => const Login(),
      },
      home: const MyHomePage(title: "Home"),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.car_crash),
              tooltip: 'New card',
              onPressed: () {
                Navigator.of(context).pushNamed('register');
              }),
          IconButton(
              icon: const Icon(Icons.newspaper),
              tooltip: 'New card',
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              }),
        ],
      ),
    );
  }
}
