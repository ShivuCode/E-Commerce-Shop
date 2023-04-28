import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    late Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: mainColor,
        title: const Text("My WishList"),
        centerTitle:true,
      ),
      body: wishList.isEmpty?const Center(child: Text("Empty Wishlist")):GridView.builder(itemCount:wishList.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width > 600 ? 4 : 2,
          childAspectRatio: size.width<800?2/3.2:2/3
      ), itemBuilder: (_,i){
        return Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 8/9,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${wishList[i]["image"]}"),
                            fit: BoxFit.cover))),
              ),
              Text("${wishList[i]["name"]}",style: const TextStyle(fontSize: 18),),
              Text("${wishList[i]["dec"]}",style: const TextStyle(
        color: Colors.grey, fontSize: 12),),
              Text("₹ ${wishList[i]["price"]}",style: const TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
        );

      }),
    );
  }
}
