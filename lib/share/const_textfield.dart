import 'package:flutter/material.dart';
 


// ignore: constant_identifier_names
const  custom_textfield=InputDecoration(
  
          // fillColor: Colors.amber,
          filled: true,
          contentPadding: EdgeInsets.all(10),
          hintText: "Enter Your E-mail :",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
            borderSide:BorderSide.none,
          ));