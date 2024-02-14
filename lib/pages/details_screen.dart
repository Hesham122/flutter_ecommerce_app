import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/model/logic.dart';
import 'package:flutter_ecommerce_app/share/appbar.dart';
import 'package:flutter_ecommerce_app/share/const_color.dart';

// ignore: camel_case_types
class Detail_Screen extends StatefulWidget {
  final Books product;

  const Detail_Screen({super.key, required this.product});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

// ignore: camel_case_types
class _Detail_ScreenState extends State<Detail_Screen> {
  // ignore: non_constant_identifier_names
  bool Is_show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main_color,
        title: const Text("Details Screen"),
        actions: const [
          ProductsAndPrice()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 22),
                child: Image.asset(widget.product.book, fit: BoxFit.cover)),
            Text(
              "\$ ${widget.product.price}",
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 255, 129, 129),
                  ),
                  child: const Text(
                    "New",
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 241, 206, 2),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 241, 206, 2),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 241, 206, 2),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 241, 206, 2),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 241, 206, 2),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 85,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.edit_location,
                      color: main_color,
                      size: 28,
                    ),
                    Text(
                      "Book Shop",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Details :",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              widget.product.sammary,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
              maxLines: Is_show ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    Is_show = !Is_show;
                  });
                },
                child: Text(
                  Is_show ? "Show More" : "Show Less",
                  style: const TextStyle(fontSize: 22),
                ))
          ],
        ),
      ),
    );
  }
}
