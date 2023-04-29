import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'SignIn_Interface.dart';


class SignUpinterface extends StatefulWidget {
  const SignUpinterface({Key? key}) : super(key: key);

  @override
  State<SignUpinterface> createState() => _SignUpinterfaceState();
}

class _SignUpinterfaceState extends State<SignUpinterface> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("2962ff"),
                hexStringToColor("2962ff"),
                hexStringToColor("2962ff")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter UserName", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    SignInSignUpButton(context,false,(){
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignInInterface()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    })
                  ],
                ),
              ))),
    );
  }
}