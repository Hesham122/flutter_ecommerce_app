// ignore_for_file: sort_child_properties_last

// import 'dart:async';

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/login.dart';
import 'package:flutter_ecommerce_app/share/check_pass.dart';
import 'package:flutter_ecommerce_app/share/const_color.dart';
import 'package:flutter_ecommerce_app/share/const_textfield.dart';
import 'package:flutter_ecommerce_app/share/snackbar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' show basename;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _keyform = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final usercontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  File? imgpath;
  String? imgname;
  bool isornotvisible = true;
  bool isloading = false;
  // bool _showText = true;
  // ignore: non_constant_identifier_names
  String data_week = "";
  // ignore: non_constant_identifier_names
  String data_exist = "";

  bool ispassword_8ch = false;
  // ignore: non_constant_identifier_names
  bool ispassword_num = false;
  // ignore: non_constant_identifier_names
  bool ispassword_upper = false;
  // ignore: non_constant_identifier_names
  bool ispassword_lower = false;
  // ignore: non_constant_identifier_names
  bool ispassword_spcharacter = false;
  checkpass(String pass) {
    ispassword_8ch = false;
    ispassword_num = false;
    ispassword_lower = false;
    ispassword_upper = false;
    ispassword_spcharacter = false;
    setState(() {
      if (pass.contains(RegExp(r'.{8,}'))) {
        ispassword_8ch = true;
      }
      if (pass.contains(RegExp(r'[0-9]'))) {
        ispassword_num = true;
      }
      if (pass.contains(RegExp(r'[A-Z]'))) {
        ispassword_upper = true;
      }
      if (pass.contains(RegExp(r'[a-z]'))) {
        ispassword_lower = true;
      }
      if (pass.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        ispassword_spcharacter = true;
      }
    });
  }

  uploadpic(List<ImageSource> values) async {
    final pickImg = await ImagePicker().pickImage(source: values.first);
    try {
      if (pickImg != null) {
        setState(() {
          imgpath = File(pickImg.path);
          imgname = basename(pickImg.path);
          int rand = Random().nextInt(999999);
          imgname = "$rand $imgname";
        });
      } else {
        // ignore: use_build_context_synchronously
        snackbarshare(context, "No image Selected");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      snackbarshare(context, "Error $e");
    }
  }

  // ignore: non_constant_identifier_names
  register_data() async {
    try {
      setState(() {
        isloading = true;
      });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,
      );
      final storageRef = FirebaseStorage.instance.ref(imgname);
      await storageRef.putFile(imgpath!);

      CollectionReference users =
          FirebaseFirestore.instance.collection('userrr');
      String urlImg = await storageRef.getDownloadURL();
      users.doc(credential.user!.uid).set({
        'full_name': usercontroller.text,
        'age': agecontroller.text,
        'title': titlecontroller.text,
        'email': emailcontroller.text,
        'password': passcontroller.text,
        'url': urlImg,
      });
      // .then((value) => print("User Added"))
      // .catchError((error) => print("Failed to add user: $error"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        data_week = '**The password provided is too weak.';
        // ignore: use_build_context_synchronously
        snackbarshare(context, data_week);
      } else if (e.code == 'email-already-in-use') {
        data_week = '**The account already exists for that email.';
        // ignore: use_build_context_synchronously
        snackbarshare(context, data_week);
      } else {
        // ignore: use_build_context_synchronously
        snackbarshare(context, "error ,please try again later");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      snackbarshare(context, e.toString());
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void dispose() {
 
    emailcontroller.dispose();
    passcontroller.dispose();
    usercontroller.dispose();
    titlecontroller.dispose();
    agecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          backgroundColor: main_color,
          title: const Text(
            "Register",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _keyform,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        imgpath == null
                            ? const CircleAvatar(
                                radius: 70,
                                backgroundColor:
                                    Color.fromARGB(255, 155, 155, 155),
                                backgroundImage:
                                    AssetImage("assets/img/th.jpeg"),
                              )
                            : ClipOval(
                                child: Image.file(
                                imgpath!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              )),
                        Positioned(
                          bottom: -2,
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 400,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                uploadpic([ImageSource.camera]);
                                                Navigator.pop(context);
                                              },
                                              child: Image.asset(
                                                "assets/img/OIP (3).jpeg",
                                                width: 99,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                uploadpic(
                                                    [ImageSource.gallery]);
                                                Navigator.pop(context);
                                              },
                                              child: Image.asset(
                                                "assets/img/download (4).jpeg",
                                                width: 99,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: const Icon(Icons.add_a_photo)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: usercontroller,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: custom_textfield.copyWith(
                          suffixIcon: const Icon(Icons.person),
                          hintText: "Enter Your Username :"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: agecontroller,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: custom_textfield.copyWith(
                          suffixIcon: const Icon(IconlyLight.activity),
                          hintText: "Enter Your Age :"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: titlecontroller,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: custom_textfield.copyWith(
                          suffixIcon: const Icon(Icons.person_2_outlined),
                          hintText: "Enter Your Title :"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value!.contains(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                            ? null
                            : "Enter a valid email";
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: custom_textfield.copyWith(
                        suffixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      onChanged: (pass) {
                        checkpass(pass);
                      },
                      validator: (value) {
                        return value!.length < 8
                            ? "Enter strong password,please"
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passcontroller,
                      keyboardType: TextInputType.text,
                      obscureText: isornotvisible,
                      decoration: custom_textfield.copyWith(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isornotvisible = !isornotvisible;
                                });
                              },
                              child: Icon(isornotvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          hintText: "Enter Your Password :"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Check_pass(
                      text: "At Least 8 charachter",
                      ispass: ispassword_8ch,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Check_pass(
                      text: "At Least 1 Number",
                      ispass: ispassword_num,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Check_pass(
                      text: "Has Uppercase",
                      ispass: ispassword_upper,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Check_pass(
                      text: "Has Lowercase",
                      ispass: ispassword_lower,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Check_pass(
                      text: "Has special charachter",
                      ispass: ispassword_spcharacter,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_keyform.currentState!.validate() &&
                            imgname != null &&
                            imgpath != null) {
                          await register_data();
                          if (!mounted) return;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        } else {
                          snackbarshare(
                              context, "Error please try again later");
                        }
                      },
                      child: isloading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Register",
                              style: TextStyle(fontSize: 18),
                            ),
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          backgroundColor:
                              const MaterialStatePropertyAll(main_color),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(15))),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Have An Account",
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
                                    builder: (context) => const Login(),
                                  ));
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
