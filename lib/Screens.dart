import 'package:e_commerce/Pages/Account.dart';
import 'package:e_commerce/Pages/CategoriesPage.dart';
import 'package:e_commerce/Pages/EarningPage.dart';
import 'package:e_commerce/Pages/HomePage.dart';
import 'package:e_commerce/Pages/SharedPage.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> with TickerProviderStateMixin {
  late double size = MediaQuery.of(context).size.width;
  int currentPage = 0;
  late TabController controller;
  List pages = const [
    HomePage(),
    CategoriesPage(),
    SharedPage(),
    EarningPage(),
    AccountPage()
  ];
  late TextStyle buttonStyle = const TextStyle(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400);
  void change(int i) {
    setState(() {
      currentPage = i;
    });
  }

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //giving appbar depends on screen
      appBar: size > 600
          ? AppBar(toolbarHeight: 70,
              foregroundColor: Colors.white,
              backgroundColor: mainColor,
              title: const Text("VStore"),
              actions: [
                Container(
                  height: 50,
                  width: 400,
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.grey,
                        hintText: "search for shoes",
                        suffixIcon: const Icon(Icons.camera_alt_outlined,
                            color: Colors.black45)),
                  ),
                ),
                TextButton(
                  child: Text("Shared", style: buttonStyle),
                  onPressed: () {
                    change(2);
                  },
                ),
                TextButton(
                  child: Text("Earnings", style: buttonStyle),
                  onPressed: () {
                    change(3);
                  },
                ),
                TextButton(
                  child: Text("Account", style: buttonStyle),
                  onPressed: () {
                    change(4);
                  },
                )
              ],
            )
          : AppBar(
              backgroundColor: mainColor,
              title: const Text("VStore"),
              centerTitle: true,
              actions: [

                  IconButton(
                      icon: const Icon(Icons.notifications_none_outlined,
                          color: Colors.white),
                      onPressed: () {}),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined,
                        color: Colors.white),
                    onPressed: () {},
                  ),
                  width(10)
                ]),
      //now writing main code for screens
      body: pages[currentPage],
      //giving bottom Navigation depends on screen
      bottomNavigationBar: size < 600
          ? BottomNavigationBar(
              fixedColor: Colors.grey,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                      ),
                      label: "Home",
                      activeIcon: Icon(
                        Icons.home,
                        color: Colors.grey,
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.manage_search_sharp, color: Colors.grey),
                      label: "Categories"),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.share, color: Colors.grey),
                      label: "Shared",
                      activeIcon: Icon(
                        CupertinoIcons.share_solid,
                        color: Colors.grey,
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.currency_rupee,
                        color: Colors.grey,
                      ),
                      label: "Earnings"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      label: "Account")
                ])
          : null,
    );
  }
}
