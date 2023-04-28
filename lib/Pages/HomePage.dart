import 'dart:convert';

import 'package:e_commerce/Pages/ItemPage.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNext = true;
  readData() {
    DefaultAssetBundle.of(context).loadString("json/stock.json").then((value) {
      setState(() {
        stock = jsonDecode(value);
        menList=stock['men'];
        womenList=stock["women"];
        homeList=stock["home"];
        allItems.addAll(menList);
        allItems.addAll(womenList);
        allItems.addAll(stock["home"]);
      });
    });
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              child: menList.isEmpty?Container():PageView.builder(
                controller: PageController(initialPage: 0),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    height: 220,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 5,
                              offset: const Offset(0, 2))
                        ],
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: NetworkImage("${menList[i]["image"]}"),
                            opacity: 0.7,
                            fit: BoxFit.fill)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 20,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(colors: [
                                mainColor,
                                mainColor.withOpacity(0.4)
                              ])),
                          child: Text(
                            "${menList[i]["name"]}",
                            style:const TextStyle(color: Colors.white),
                          ),
                        ),
                        height(10.0),
                        const Text(
                          "New Arrive",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        height(10),
                        Text(
                          "${menList[i]["dec"]}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        height(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(i==0?Icons.circle:CupertinoIcons.circle,size: 10,color: Colors.white,),
                            Icon(i==1?Icons.circle:CupertinoIcons.circle,size: 10,color: Colors.white,),
                            Icon(i==2?Icons.circle:CupertinoIcons.circle,size: 10,color: Colors.white,),
                            Icon(i==3?Icons.circle:CupertinoIcons.circle,size: 10,color: Colors.white,),
                            Icon(i==4?Icons.circle:CupertinoIcons.circle,size: 10,color: Colors.white,),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            height(20),
            SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Popular", style: TextStyle(fontSize: 26)),
                    Text(
                      "See all >",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )),
            const Text("Men's Fashion",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
            SizedBox(
              height: 200,
              child: menList.isEmpty?Container():ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menList.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          nextScreen(context, Item(item: menList[i]));
                          if (!recent.contains(menList[i])) {
                            setState(() {
                              recent.add(menList[i]);
                            });
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 120,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage("${menList[i]["image"]}"),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              "${menList[i]["name"]}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            height(5),
                            Container(
                              height: 22,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(colors: [
                                    mainColor,
                                    mainColor.withOpacity(0.4)
                                  ])),
                              child: Text("₹ ${menList[i]["price"]}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            height(10),
            const Text("Women's Fashion",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
            SizedBox(
              height: 200,
              child: womenList.isEmpty?Container():ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: womenList.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          nextScreen(context, Item(item: womenList[i]));
                          if (!recent.contains(womenList[i])) {
                            setState(() {
                              recent.add(womenList[i]);
                            });
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 120,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage("${womenList[i]["image"]}"),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              "${womenList[i]["name"]}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            height(5),
                            Container(
                              height: 22,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(colors: [
                                    mainColor,
                                    mainColor.withOpacity(0.4)
                                  ])),
                              child: Text("₹ ${womenList[i]["price"]}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Recent Products",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    Text(
                      "see all >",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recent.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          nextScreen(context, Item(item: recent[i]));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 120,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage("${recent[i]["image"]}"),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              "${recent[i]["name"]}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            height(5),
                            Container(
                              height: 22,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(colors: [
                                    mainColor,
                                    mainColor.withOpacity(0.4)
                                  ])),
                              child: Text("₹ ${recent[i]["price"]}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
