import 'package:flutter/material.dart';

import '../constants.dart';
import 'ItemPage.dart';

class Categories extends StatefulWidget {
  List search;
  Categories({Key? key,required this.search}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    double size=MediaQuery.of(context).size.width;
    return Scaffold(body:widget.search.isEmpty
        ? const Center(
      child: Text(
        "Product Not Available",
        style: TextStyle(fontSize: 20),
      ),
    )
        : Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GridView.builder(
        itemCount: widget.search.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size > 600 ? 4 : 2,
            childAspectRatio: 2 / 3.2),
        itemBuilder: (_, i) => GestureDetector(
            onTap: () {
              nextScreen(
                  context,
                  Item(
                    item: widget.search[i],
                  ));
            },
            child: GestureDetector(
              onTap: () {
                nextScreen(context, Item(item: widget.search[i]));
                if (!recent.contains(widget.search[i])) {
                  setState(() {
                    recent.add(widget.search[i]);
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
                                    "${widget.search[i]["image"]}"),
                                fit: BoxFit.cover))),
                    Text(
                      "${widget.search[i]["name"]}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${widget.search[i]["dec"]}",
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 12),
                    ),
                    height(5),
                    Text(
                      "₹ ${widget.search[i]["price"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
      ),
    ));
  }
}
