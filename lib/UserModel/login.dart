
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Database/mongodb.dart';
import 'UserClass.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    const Text ("Login", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 20,),
                    Text("Bienvenue ! Connecte toi.",style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),),
                    const SizedBox(height: 30,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40
                  ),
                  child: Column(
                    children: [
                      makeInput(label: "Email", controller: mailController),
                      makeInput(label: "Password", controller:passwordController, obsureText: true),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3,left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.indigo,
                        border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black)
                        )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:60,
                      onPressed: () async {
                        if ((passwordController.text.isNotEmpty) && (mailController.text.isNotEmpty)){
                          var userToFind = await MongoDatabase.getUser(mailController.text);
                          print(userToFind);
                          if (userToFind['password'] == passwordController.text){
                            print("===========================VALIDER===========================");
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: const Text("Login",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                      ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Dont have an account?"),
                    Text("Sign Up",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),),
                  ],
                )
              ],

            ),
          ],
        ),
      ),
    );
  }
}

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
