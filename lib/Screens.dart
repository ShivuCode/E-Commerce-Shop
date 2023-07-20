import 'package:e_commerce/Pages/Account.dart';
import 'package:e_commerce/Pages/AddToCardPage.dart';
import 'package:e_commerce/Pages/CategoriesPage.dart';
import 'package:e_commerce/Pages/EarningPage.dart';
import 'package:e_commerce/Pages/HomePage.dart';
import 'package:e_commerce/Pages/SearchPage.dart';
import 'package:e_commerce/Pages/WishList.dart';
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
  List pages = [
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
      drawer: size > 600
          ? Drawer(
              width: 60,
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(CupertinoIcons.home),
                    onTap: () {
                      setState(() {
                        currentPage = 0;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.manage_search_sharp),
                    onTap: () {
                      setState(() {
                        currentPage = 1;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(CupertinoIcons.share),
                    onTap: () {
                      setState(() {
                        currentPage = 2;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.currency_rupee,
                    ),
                    onTap: () {
                      setState(() {
                        currentPage = 3;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    onTap: () {
                      setState(() {
                        currentPage = 4;
                      });
                    },
                  ),
                ],
              ))
          : null,
      //giving appbar depends on screen
      appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("VStore"),
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(CupertinoIcons.heart, color: Colors.white),
                onPressed: () {
                  nextScreen(context, const WishList());
                }),
            IconButton(
              icon:
                  const Icon(Icons.shopping_bag_outlined, color: Colors.white),
              onPressed: () {
                nextScreen(context, const AddToCard());
              },
            ),
            width(10)
          ]),
      //now writing main code for screens
      body: pages[currentPage],
      //giving bottom Navigation depends on screen
      bottomNavigationBar: size < 600
          ? BottomNavigationBar(
              currentIndex: currentPage,
              selectedItemColor: mainColor,
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
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.manage_search_sharp),
                    label: "Categories",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.share),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.currency_rupee,
                    ),
                    label: "Earnings",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: "Account",
                  )
                ])
          : null,
    );
  }
}
