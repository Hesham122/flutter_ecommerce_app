import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/model/logic.dart';
import 'package:flutter_ecommerce_app/pages/check_out.dart';
import 'package:flutter_ecommerce_app/pages/details_screen.dart';
import 'package:flutter_ecommerce_app/pages/profile_page.dart';
import 'package:flutter_ecommerce_app/provider/cart.dart';
import 'package:flutter_ecommerce_app/share/appbar.dart';
import 'package:flutter_ecommerce_app/share/const_color.dart';
import 'package:flutter_ecommerce_app/share/userimg.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

  
    final value = Provider.of<Cart>(context);
    final userInfo = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: bg_color,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    "Hesham"
                  ),
                  accountEmail: Text(userInfo.email!),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/lib.jpeg"),
                          fit: BoxFit.cover)),
                  currentAccountPicture: const User_img()
                
                ),
              
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: main_color,
                    size: 28,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    color: main_color,
                    Icons.add_shopping_cart,
                    size: 28,
                  ),
                  title: const Text(
                    "MyProducts",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Check_Out_screen(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    color: main_color,
                    Icons.help_center,
                    size: 28,
                  ),
                  title: const Text(
                    "About",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    color: main_color,
                    Icons.person,
                    size: 28,
                  ),
                  title: const Text(
                    "Profile Page",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile_page(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    color: main_color,
                    Icons.exit_to_app,
                    size: 28,
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  "Developed By Hesham Mohamed © 2023",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: main_color,
        title: const Text("Home"),
        actions: const [
          ProductsAndPrice(),
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 22,
          ),
          itemCount: allbook.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Detail_Screen(product: allbook[index]),
                    ));
              },
              child: GridTile(
                footer: GridTileBar(
                  trailing: IconButton(
                      onPressed: () {
                        value.addProduct(allbook[index]);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                  leading: Text("     \$ ${allbook[index].price}"),
                  title: const Text(""),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11)),
                  margin: const EdgeInsets.all(22),
                  padding: const EdgeInsets.only(bottom: 11, top: 12),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -3,
                        top: 4,
                        left: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(allbook[index].book),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
