import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class User_img extends StatefulWidget {
const  User_img({
    super.key,
  });

  @override
  State<User_img> createState() => _User_imgState();
}

// ignore: camel_case_types
class _User_imgState extends State<User_img> {
  CollectionReference users = FirebaseFirestore.instance.collection('userrr');
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(credential!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return CircleAvatar(
            radius: 70,
            backgroundColor: const Color.fromARGB(255, 155, 155, 155),
            backgroundImage: NetworkImage(data['url']),
          );
        }

        return const Text("loading");
      },
    );
  }
}
