import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class AddToCard extends StatefulWidget {
  const AddToCard({Key? key}) : super(key: key);

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  int qty = 1;
  int sum=0;
  update(i,int qty){

      sum=addCard[i]["price"];
      sum*=qty;
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mainColor),
      bottomNavigationBar: BottomAppBar(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("₹ 2999.0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    maximumSize: MaterialStateProperty.all(const Size(300, 60)),
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 10))),
                child: const Text("Proceed to Payment"),
              )
            ],
          )),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text("Deliver to: Daman- 396210"),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(mainColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: const BorderSide(color: Colors.grey)))),
                  child: const Text("Change"))
            ],
          ),
          const Divider(thickness: 4),
          Expanded(
              child: ListView.builder(
                  itemCount: addCard.length,
                  itemBuilder: (_, i) {
                    update(i, qty);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children:[
                              Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height:90,
                                    width: 90,
                                    child: Image.network(
                                      "${addCard[i]["image"]}",
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  children: [
                                    const Text("Qty: "),
                                    DropdownButton(
                                      hint: const Text("QTY :"),
                                      value: qty,
                                      onChanged: (value) {
                                        setState(() {
                                          qty = value!;
                                          update(i,qty);
                                        });
                                      },
                                      items: <int>[
                                        1,
                                        2,
                                        3,
                                        4,
                                      ].map<DropdownMenuItem<int>>((int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(value.toString()),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                              width(10),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${addCard[i]["name"]}",style:const TextStyle(fontSize: 26,fontWeight: FontWeight.w400)),
                                  SizedBox(width: 200,child: Text("${addCard[i]["dec"]}",softWrap: true,)),
                                  height(5),
                                  Text("₹ $sum",style: const TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Size : ${addCard[i]["defaultSize"]}")
                                ],
                              ),
                          ]
                          ),
                          height(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    addCard.removeAt(i);
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.delete,size: 12,color: Colors.grey[600],),
                                    Text(" Remove",style: TextStyle(color: Colors.grey[600]),)
                                  ],
                                ),
                              ),
                              Row(
                                children:[
                                  Icon(Icons.save,size: 12,color: Colors.grey[600],),
                                  Text(" Save for later",style: TextStyle(color: Colors.grey[600]),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
