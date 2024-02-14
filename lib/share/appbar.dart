import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/check_out.dart';
import 'package:flutter_ecommerce_app/provider/cart.dart';
import 'package:provider/provider.dart';

class ProductsAndPrice extends StatelessWidget {
  const ProductsAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Cart>(context);
    return Row(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 164, 235, 82)),
              child: Text(
                "${value.SelectedProduct.length}",
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Check_Out_screen(),
                      ));
                },
                icon: const Icon(
                  Icons.add_shopping_cart,
                  size: 26,
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "\$ ${value.price}",
            style: const TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
