import 'package:flutter/material.dart';

snackbarshare(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      action: SnackBarAction(label: "close", onPressed: () {}),
      duration: const Duration(seconds: 5),
      content: Text(text)));
}

// this is anther way to show message error
// Timer(Duration(seconds: 5), () {
//           setState(() {
//             _showText = false;
//           });
//         })
