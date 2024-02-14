import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/provider/cart.dart';
import 'package:flutter_ecommerce_app/share/appbar.dart';
import 'package:flutter_ecommerce_app/share/const_color.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Check_Out_screen extends StatelessWidget {
  const Check_Out_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: bg_color,
      appBar: AppBar(
          backgroundColor: main_color,
          title: const Text("Check Out"),
          actions: const [ProductsAndPrice()]),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
                itemCount: value.SelectedProduct.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            value.removeProduct(value.SelectedProduct[index]);
                          },
                          icon: const Icon(Icons.remove)),
                      subtitle:
                          Text("\$ ${value.SelectedProduct[index].price}"),
                      title: Text("${value.SelectedProduct[index].name}"),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(value.SelectedProduct[index].book),
                      ),
                    ),
                  );
                }),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.brown),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
            child: Text(
              " Pay \$ ${value.price}",
              style: const TextStyle(fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
