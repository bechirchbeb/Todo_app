import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiletodo/reusable_widgets/reusable_widget.dart';
import 'package:mobiletodo/utils/color_utils.dart';

import 'SignUp_Interface.dart';
import 'homepage.dart';

class SignInInterface extends StatefulWidget {
  const SignInInterface({Key? key}) : super(key: key);

  @override
  State<SignInInterface> createState() => _SignInInterfaceState();
}

class _SignInInterfaceState extends State<SignInInterface> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
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
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery
              .of(context)
              .size
              .height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("images/boch.png"), const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              const SizedBox(
                height: 5,
              ),
              SignInSignUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption(context)
            ],
          ),
        ),
      ),
    ),
    );
  }

  Row signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpinterface()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}