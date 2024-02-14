import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Getdata_firestore extends StatefulWidget {
  final String documentId;
  const Getdata_firestore({super.key, required this.documentId});

  @override
  State<Getdata_firestore> createState() => _Getdata_firestoreState();
}

// ignore: camel_case_types
class _Getdata_firestoreState extends State<Getdata_firestore> {
  CollectionReference users = FirebaseFirestore.instance.collection('userrr');
  final credential = FirebaseAuth.instance.currentUser;
  // ignore: non_constant_identifier_names
  final edit_data_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  show_dialog_edit(Map data, dynamic keyName) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(22),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(11)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: edit_data_controller,
                    maxLength: 22,
                    decoration: InputDecoration(hintText: "${data[keyName]}"),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            users
                                .doc(credential!.uid)
                                .update({keyName: edit_data_controller.text});

                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(fontSize: 20),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "cancel",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
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
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                      
                        width: 250,
                        child: Text(
                          "FullName: ${data['full_name']} ",
                          
                          
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  users.doc(credential!.uid).update(
                                      {'full_name': FieldValue.delete()});
                                });
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                show_dialog_edit(data, 'full_name');
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       show_dialog_edit(data, 'full_name');
                      //     },
                      //     icon: Icon(Icons.edit)),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Age: ${data['age']} ",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  users
                                      .doc(credential!.uid)
                                      .update({'age': FieldValue.delete()});
                                });
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                show_dialog_edit(data, 'age');
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       show_dialog_edit(data, 'Age');
                      //     },
                      //     icon: Icon(Icons.edit)),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email: ${data['email']} ",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  users
                                      .doc(credential!.uid)
                                      .update({'email': FieldValue.delete()});
                                });
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                show_dialog_edit(data, 'email');
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       show_dialog_edit(data, 'email');
                      //     },
                      //     icon: Icon(Icons.edit)),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Password: ${data['password']} ",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  users.doc(credential!.uid).update(
                                      {'password': FieldValue.delete()});
                                });
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                show_dialog_edit(data, 'password');
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {}, icon: Icon(Icons.delete)),
                      //     IconButton(
                      //         onPressed: () {
                      //           show_dialog_edit(data, 'password');
                      //         },
                      //         icon: Icon(Icons.edit)),
                      //   ],
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title: ${data['title']} ",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  users
                                      .doc(credential!.uid)
                                      .update({'title': FieldValue.delete()});
                                });
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                show_dialog_edit(data, 'title');
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            users.doc(credential!.uid).delete();
                          });
                        },
                        child: const Text(
                          "Delete All",
                          style: TextStyle(fontSize: 22),
                        )),
                  ),
                ],
              ),
            ),
          );
        }

        return const Text("loading");
      },
    );
  }
}
