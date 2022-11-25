import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_flutter_pmu/UserModel/UserProfil.dart';
import 'package:projet_flutter_pmu/UserModel/login.dart';

import '../Database/mongodb.dart';
import '../NavBar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      //bottomNavigationBar: generalBottomNavigationBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Créer un compte",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Gere ton PMU !",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          makeInput(label: "Mail", controller: mailController),
                          makeInput(
                              label: "Mot de passe",
                              controller: passwordController,
                              obsureText: true),
                          makeInput(
                              label: "Confirmation mot de passe",
                              controller: confirmPasswordController,
                              obsureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                            border: const Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black))),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            if (passwordController.text == confirmPasswordController.text && (passwordController.text.isNotEmpty) && (mailController.text.isNotEmpty)){
                              await MongoDatabase.createUser(mailController.text, passwordController.text);
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserProfil()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Valider",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("T'a déja ton compte ?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) => Login()));
                          },
                          child: Text(
                            "Connexion",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, controller, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obsureText,
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le champ est vide !';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}
