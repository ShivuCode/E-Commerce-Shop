import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'ItemPage.dart';

class SharedPage extends StatefulWidget {
  const SharedPage({Key? key}) : super(key: key);

  @override
  State<SharedPage> createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  List display = allItems;
  void update(val) {
    setState(() {
      display = allItems
          .where((element) =>
              element["name"]!.toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: size > 600
              ? null
              : PreferredSize(
                  preferredSize: const Size(double.infinity, 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size * 0.95,
                          height: 60,
                          child: TextField(
                            onChanged: (value) => update(value),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "What can we do for you....",
                                prefixIcon: const Icon(CupertinoIcons.search),
                                prefixIconColor: Colors.grey,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                )),
                          )),
                    ],
                  )),
          body: display.isEmpty
              ? const Center(
                  child: Text(
                    "Product Not Available",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GridView.builder(
                    itemCount: display.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size > 600 ? 4 : 2,
                        childAspectRatio: 2 / 3.2),
                    itemBuilder: (_, i) => GestureDetector(
                        onTap: () {
                          nextScreen(
                              context,
                              Item(
                                item: display[i],
                              ));
                        },
                        child: GestureDetector(
                          onTap: () {
                            nextScreen(context, Item(item: display[i]));
                            if (!recent.contains(display[i])) {
                              setState(() {
                                recent.add(display[i]);
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height*0.25,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${display[i]["image"]}"),
                                            fit: BoxFit.cover))),
                                Text(
                                  "${display[i]["name"]}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "${display[i]["dec"]}",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                height(5),
                                Text(
                                  "₹ ${display[i]["price"]}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                )),
    );
  }
}
