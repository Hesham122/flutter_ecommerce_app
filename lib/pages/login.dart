// ignore_for_file: sort_child_properties_last

// import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/register.dart';
import 'package:flutter_ecommerce_app/pages/reset_pass.dart';
import 'package:flutter_ecommerce_app/provider/google_signin.dart';
import 'package:flutter_ecommerce_app/share/const_color.dart';
import 'package:flutter_ecommerce_app/share/const_textfield.dart';
import 'package:flutter_ecommerce_app/share/snackbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();

  final passcontroller = TextEditingController();
  bool _showText = true;
  // ignore: non_constant_identifier_names
  Signin_check() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });

    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,
      );
      if (!mounted) return;
      snackbarshare(context, 'Done');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackbarshare(context, "Error${e.code}");
      } else if (e.code == 'wrong-password') {
        snackbarshare(context, 'Wrong password provided for that user.');
        // print();
      } else {
        snackbarshare(context, 'Error .....');
      }
    }
    if (!mounted) return;
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    
    passcontroller.dispose();
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<GoogleSignInProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: custom_textfield.copyWith(
                        suffixIcon: const Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  TextField(
                    controller: passcontroller,
                    keyboardType: TextInputType.text,
                    obscureText: _showText,
                    decoration: custom_textfield.copyWith(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showText = !_showText;
                              });
                            },
                            child: Icon(_showText
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintText: "Enter Your Password :"),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Signin_check();
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                        backgroundColor:
                            const MaterialStatePropertyAll(main_color),
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Reset_pass()));
                      },
                      child: const Text(
                        "Forget Password..?",
                        style: TextStyle(
                            fontSize: 20, decoration: TextDecoration.underline),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have An Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      )),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                        )),
                    child: GestureDetector(
                      onTap: () {
                        value.googlelogin();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/google-plus.svg",
                        height: 40,
                        // ignore: deprecated_member_use
                        color: Colors.deepOrange,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
