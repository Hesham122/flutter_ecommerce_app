import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/login.dart';
import 'package:flutter_ecommerce_app/share/const_color.dart';
import 'package:flutter_ecommerce_app/share/const_textfield.dart';
import 'package:flutter_ecommerce_app/share/snackbar.dart';

// ignore: camel_case_types
class Reset_pass extends StatefulWidget {
  const Reset_pass({super.key});

  @override
  State<Reset_pass> createState() => _Reset_passState();
}

// ignore: camel_case_types
class _Reset_passState extends State<Reset_pass> {
  final _keyform = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  // bool isloading = false;
  // ignore: non_constant_identifier_names
  send_email() async {
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
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text);
      if (!mounted) return;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ));
          if (!mounted) return;
      snackbarshare(context, "Done,Please check your email");
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
    
    // Navigator.pop(context);
  }

  @override
  void dispose() {
     
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main_color,
        title: const Text("Reset Password"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child:
          
           Form(
            key: _keyform,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Enter your email to reset your password",
                style: TextStyle(fontSize: 18),
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
              ElevatedButton(
                onPressed: () async {
                  if (_keyform.currentState!.validate()) {
                    send_email();
                  } else {
                    snackbarshare(context, "Error please try again later");
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    backgroundColor: const MaterialStatePropertyAll(main_color),
                    padding:
                        const MaterialStatePropertyAll(EdgeInsets.all(15))),
                //  isloading
                //     ? CircularProgressIndicator(
                //         color: Colors.white,
                //       )
                child: const Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
