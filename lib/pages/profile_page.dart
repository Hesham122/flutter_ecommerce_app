import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/share/const_color.dart';
import 'package:flutter_ecommerce_app/share/getdata_from_firestore.dart';
import 'package:flutter_ecommerce_app/share/snackbar.dart';

import 'package:flutter_ecommerce_app/share/userimg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' show basename;
import 'package:firebase_storage/firebase_storage.dart';

// ignore: camel_case_types
class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

// ignore: camel_case_types
class _Profile_pageState extends State<Profile_page> {
  File? imgpath;
  String? imgname;
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

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('userrr');
    final data = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main_color,
        title: const Text("Profile Page"),
        actions: [
          TextButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 27,
              ),
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  imgpath == null
                      ? const User_img()
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
                                        onTap: () async {
                                        await  uploadpic([ImageSource.camera]);
                                            if(imgpath!=null){
                                              final storageRef = FirebaseStorage
                                              .instance
                                              .ref(imgname);
                                          await storageRef.putFile(imgpath!);
                                          String urlImg = await storageRef.getDownloadURL();
                                          users 
                                              .doc(data!.uid)
                                              .update({"url": urlImg});
                                            }
                                        },
                                        child: Image.asset(
                                          "assets/img/OIP (3).jpeg",
                                          width: 99,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async{
                                        await  uploadpic([ImageSource.gallery]);
                                            if(imgpath!=null){
                                              final storageRef = FirebaseStorage
                                              .instance
                                              .ref(imgname);
                                          await storageRef.putFile(imgpath!);
                                          String urlImg = await storageRef.getDownloadURL();
                                          users 
                                              .doc(data!.uid)
                                              .update({"url": urlImg});
                                            }
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
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: main_color,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    "info from firebase Auth",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(11),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 1,
                    // ),
                    Text(
                      "Email : ${data!.email}",
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Created date : ${DateFormat.yMMMd().format(data.metadata.creationTime!)}",
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Last Sign in : ${DateFormat.yMMMd().format(data.metadata.lastSignInTime!)}",
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 33,
              // ),
              TextButton(
                  onPressed: () {
                    data.delete();
                  },
                  child: const Text(
                    "Delete All",
                    style: TextStyle(fontSize: 22),
                  )),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: main_color, borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  "info from firebase firestore",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),

              Getdata_firestore(documentId: data.uid),
            ],
          ),
        ),
      ),
    );
  }
}
