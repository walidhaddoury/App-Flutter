import 'package:flutter/material.dart';
import 'package:projet_flutter_pmu/UserModel/UserClass.dart';
import "dart:math";

import 'package:projet_flutter_pmu/mongodb.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                //newEvent(),
                //newRider(),
                //newConcours(),
                //newCourses(),
                //soireeProgrammee(),
                allUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class newEvent extends StatelessWidget {
//   const newEvent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Card(
//         elevation: 5.0,
//         child: SizedBox(
//           width: 400,
//           height: 300,
//           child: Column(children: const <Widget>[
//             ListTile(
//               leading: Icon(
//                 Icons.add_alert_sharp,
//                 size: 50,
//               ),
//             ),
//             ListTile(
//                 title: Text("Nouveau événement !!!!",
//                     textAlign: TextAlign.center)),
//             ListTile(title: Text(" blalallalal", textAlign: TextAlign.center)),
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
// /*class newRider extends StatelessWidget {
//   const newRider({super.key});
//
//   var user;
//
//   @override
//   Widget build(BuildContext context) {
//     user = MongoDatabase.getAllUser().then((retour) {
//       user = retour;
//     });
//     return Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Card(
//             elevation: 5.0,
//             child: SizedBox(
//               width: 400,
//               height: 300,
//               child: Column(
//                   children: [
//                     Text(user["username"]),
//                   ],
//                   future: MongoDatabase.getAllUser(),
//                   builder: (context, AsyncSnapshot snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else {
//                       if (snapshot.hasData) {
//                         var totalData = snapshot.data.lenght;
//                         print("Total data" + totalData.toString());
//                         return ListView.builder(
//                             itemCount: snapshot.data.lenght,
//                             itemBuilder: (context, index) {
//                               return displayCard(snapshot.data[index]);
//                             });
//                       } else {
//                         return Center(
//                           child: Text("pas de date valable"),
//                         );
//                       }
//                     }
//                   }),
//             )));
//   }*/
//
//   Widget displayCard(User data) {
//     return Card(
//       child: Column(
//         children: [
//           Text("${data.age}"),
//           SizedBox(
//             height: 5,
//           ),
//           Text("${data.firstName}"),
//           SizedBox(
//             height: 5,
//           ),
//           Text("${data.lastName}"),
//           SizedBox(
//             height: 5,
//           ),
//           Text("${data.mail}"),
//         ],
//       ),
//     );
//   }
// //}
//
// class newConcours extends StatelessWidget {
//   const newConcours({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//             child: Row(
//           children: [
//             Expanded(
//               child: Card(
//                 elevation: 5.0,
//                 child: SizedBox(
//                   width: 400,
//                   height: 300,
//                   child: Column(children: const <Widget>[
//                     ListTile(
//                       leading: Icon(
//                         Icons.new_releases,
//                         size: 50,
//                       ),
//                     ),
//                     ListTile(
//                         title: Text(" Nouveau concours !!! ",
//                             textAlign: TextAlign.center)),
//                     ListTile(
//                         title: Text(" ndaiudijazdni azinj",
//                             textAlign: TextAlign.center)),
//                   ]),
//                 ),
//               ),
//             ),
//           ],
//         )));
//   }
// }
//
// class newCourses extends StatelessWidget {
//   const newCourses({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Card(
//         elevation: 5.0,
//         child: SizedBox(
//           width: 400,
//           height: 300,
//           child: Column(children: const <Widget>[
//             ListTile(
//               leading: Icon(
//                 Icons.run_circle,
//                 size: 50,
//               ),
//             ),
//             ListTile(
//                 title:
//                     Text("Nouvelle course !!!", textAlign: TextAlign.center)),
//             ListTile(title: Text("  ", textAlign: TextAlign.center)),
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
// class soireeProgrammee extends StatelessWidget {
//   const soireeProgrammee({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Card(
//         elevation: 5.0,
//         child: SizedBox(
//           width: 400,
//           height: 300,
//           child: Column(children: const <Widget>[
//             ListTile(
//               leading: Icon(
//                 Icons.music_note_outlined,
//                 size: 50,
//               ),
//             ),
//             ListTile(
//                 title: Text("Nouveau Cavalier, bonjour ...",
//                     textAlign: TextAlign.center)),
//             ListTile(title: Text("nom : ...", textAlign: TextAlign.center)),
//           ]),
//         ),
//       ),
//     );
//   }
// }

class allUser extends StatefulWidget {
  const allUser({super.key});

  @override
  State<StatefulWidget> createState() => _allUser();
}

class _allUser extends State<StatefulWidget> {
  var user;
  var usernameController;

  @override
  Widget build(BuildContext context) {
    user = MongoDatabase.getAllUser().then((retour) {
        user = retour;
        usernameController = user['mail'];
        print(retour);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('${usernameController}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
