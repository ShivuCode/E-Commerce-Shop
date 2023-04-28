import 'package:e_commerce/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  Map<String, dynamic> item;
  Item({Key? key, required this.item}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int deliverAt = DateTime.now().day + 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    addCard.add(widget.item);
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade200),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    maximumSize: MaterialStateProperty.all(const Size(300, 60)),
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 10))),
                child: const Text("Add To Card"),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    maximumSize: MaterialStateProperty.all(const Size(300, 60)),
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 10))),
                child: const Text("Buy Now"),
              )
            ],
          )),
      body: MediaQuery.of(context).size.width<600?Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(30),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 5,
                              offset: const Offset(0, 5))
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage("${widget.item["image"]}"),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹ ${widget.item["price"]}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  wishList.add(widget.item);
                                  widget.item['like']=true;
                                  print(widget.item["like"]);
                                });
                              },
                              icon: widget.item["like"]? const Icon(CupertinoIcons.heart_fill,color: Colors.red,):const Icon(CupertinoIcons.heart)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share_outlined))
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${widget.item["name"]}",
                    style: const TextStyle(fontSize: 21),
                  ),
                  height(5),
                  const Text("Select Size", style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 75,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 2),
                        itemCount: widget.item["size"].length,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: ()=>setState(() {
                              widget.item["defaultSize"]=widget.item["size"][i];
                            }),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                 border:Border.all(color:widget.item['defaultSize'].toString()=="${widget.item["size"][i]}"?mainColor: Colors.grey),
                              ),child:  Text("${widget.item["size"][i]}"),
                              ),
                            );
                        }),
                  ),
                  height(10),
                  Text("Size : ${widget.item["defaultSize"]}"),
                  const Text("Description", style: TextStyle(fontSize: 16)),
                  Text(
                    "${widget.item["dec"]}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  height(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.delivery_dining_outlined,
                              size: 20,
                            ),
                            Text.rich(TextSpan(
                                text: " Free",
                                style: const TextStyle(color: Colors.green),
                                children: [
                                  TextSpan(
                                      text: " | Delivery by $deliverAt ",
                                      style:
                                          const TextStyle(color: Colors.black))
                                ])),
                          ],
                        ),
                        const Icon(
                          CupertinoIcons.right_chevron,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  height(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              CupertinoIcons.refresh_thick,
                              size: 18,
                            ),
                            Text(" 3 Days Return Applications")
                          ],
                        ),
                        const Icon(
                          CupertinoIcons.right_chevron,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  height(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.currency_rupee,
                              size: 18,
                            ),
                            Text("Cash on Delivery Available")
                          ],
                        ),
                        const Icon(
                          CupertinoIcons.right_chevron,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  height(15),
                  const Text(
                    "Products Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  height(10),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: const [
                      TableRow(
                          children: [
                        TableCell(
                            child: Text(
                          "Color",
                          style: TextStyle(fontSize: 18),
                        )),
                        TableCell(
                            child: Text(
                          "Black",
                          style: TextStyle(fontSize: 18),
                        ))
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text(
                          "Color",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )),
                        TableCell(
                          child: Text(
                            "Black",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text(
                          "Color Code ",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )),
                        TableCell(
                            child: Text(
                          "black",
                          style: TextStyle(fontSize: 18),
                        ))
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text(
                          "Type",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )),
                        TableCell(
                            child: Text(
                          "Shoes",
                          style: TextStyle(fontSize: 18),
                        ))
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Text(
                          "Ideal For",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )),
                        TableCell(
                            child: Text(
                          "Men",
                          style: TextStyle(fontSize: 18),
                        ))
                      ])
                    ],
                  ),
                  height(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("All Retails",style: TextStyle(fontSize: 18),),
                      Icon(CupertinoIcons.right_chevron)
                    ],
                  ),
                  height(10),
                  const Text("Recent View",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                  height(10),
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
                                            AssetImage("${recent[i]["image"]}"),
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
          ),
        ],
      ):Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 5,
                            offset: const Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: NetworkImage("${widget.item["image"]}"),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.item["name"]}",
                            style: const TextStyle(fontSize: 26,color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹ ${widget.item["price"]}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          wishList.add(widget.item);
                                          widget.item['like']=true;
                                          print(widget.item["like"]);
                                        });
                                      },
                                      icon: widget.item["like"]? const Icon(CupertinoIcons.heart_fill,color: Colors.red,):const Icon(CupertinoIcons.heart)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share_outlined))
                                ],
                              )
                            ],
                          ),
                          height(5),
                          const Text("Select Size", style: TextStyle(fontSize: 16)),
                          SizedBox(
                            height: 100,
                            child: GridView.builder(
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2),
                                itemCount: widget.item["size"].length,
                                itemBuilder: (_, i) {
                                  return GestureDetector(
                                    onTap: ()=>setState(() {
                                      widget.item["defaultSize"]=widget.item["size"][i];
                                    }),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border:Border.all(color:widget.item['defaultSize'].toString()=="${widget.item["size"][i]}"?mainColor: Colors.grey),
                                      ),child:  Text("${widget.item["size"][i]}"),
                                    ),
                                  );
                                }),
                          ),
                          height(10),
                          Text("Size : ${widget.item["defaultSize"]}"),
                          const Text("Description", style: TextStyle(fontSize: 16)),
                          Text(
                            "${widget.item["dec"]}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          height(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.delivery_dining_outlined,
                                      size: 20,
                                    ),
                                    Text.rich(TextSpan(
                                        text: " Free",
                                        style: const TextStyle(color: Colors.green),
                                        children: [
                                          TextSpan(
                                              text: " | Delivery by $deliverAt ",
                                              style:
                                              const TextStyle(color: Colors.black))
                                        ])),
                                  ],
                                ),
                                const Icon(
                                  CupertinoIcons.right_chevron,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          height(8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.refresh_thick,
                                      size: 18,
                                    ),
                                    Text(" 3 Days Return Applications")
                                  ],
                                ),
                                const Icon(
                                  CupertinoIcons.right_chevron,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          height(8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.currency_rupee,
                                      size: 18,
                                    ),
                                    Text("Cash on Delivery Available")
                                  ],
                                ),
                                const Icon(
                                  CupertinoIcons.right_chevron,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          height(15),
                          const Text(
                            "Products Details",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          height(10),
                          Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            children: const [
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Text(
                                          "Color",
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    TableCell(
                                        child: Text(
                                          "Black",
                                          style: TextStyle(fontSize: 18),
                                        ))
                                  ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text(
                                      "Color",
                                      style: TextStyle(fontSize: 18, color: Colors.grey),
                                    )),
                                TableCell(
                                  child: Text(
                                    "Black",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text(
                                      "Color Code ",
                                      style: TextStyle(fontSize: 18, color: Colors.grey),
                                    )),
                                TableCell(
                                    child: Text(
                                      "black",
                                      style: TextStyle(fontSize: 18),
                                    ))
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text(
                                      "Type",
                                      style: TextStyle(fontSize: 18, color: Colors.grey),
                                    )),
                                TableCell(
                                    child: Text(
                                      "Shoes",
                                      style: TextStyle(fontSize: 18),
                                    ))
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Text(
                                      "Ideal For",
                                      style: TextStyle(fontSize: 18, color: Colors.grey),
                                    )),
                                TableCell(
                                    child: Text(
                                      "Men",
                                      style: TextStyle(fontSize: 18),
                                    ))
                              ])
                            ],
                          ),
                          height(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("All Retails",style: TextStyle(fontSize: 18),),
                              Icon(CupertinoIcons.right_chevron)
                            ],
                          ),
                          height(10),
                          const Text("Recent View",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                          height(10),
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
                                                    AssetImage("${recent[i]["image"]}"),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
