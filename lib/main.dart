import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/firebase_options.dart';
import 'package:flutter_ecommerce_app/pages/login.dart';
import 'package:flutter_ecommerce_app/pages/verify_email.dart';
import 'package:flutter_ecommerce_app/provider/cart.dart';
import 'package:flutter_ecommerce_app/provider/google_signin.dart';
import 'package:flutter_ecommerce_app/share/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Cart();
        }),
        ChangeNotifierProvider(create: (context) {
          return GoogleSignInProvider();
        }),
      ],
      child: MaterialApp(
          title: "myApp",
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return snackbarshare(context, "Something went wrong");
              } else if (snapshot.hasData) {
                // if (mounted) return;
                return const VerifyEmailPage(); // home() OR verify email
              } else {
                return const Login();
              }
            },
          )),
    );
  }
}
