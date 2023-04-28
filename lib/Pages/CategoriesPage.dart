import 'package:e_commerce/Pages/Categories.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
   CategoriesPage({Key? key}) : super(key: key);
  final List<String> category=[
    "Women Fashion",
    "Men's Fashion",
    "Women Accessories",
    "Men Accessories",
    "Home",
    "Grocery"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: category.isEmpty?Center():Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(itemCount:category.length,gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 8
        ), itemBuilder: (_,i)=>GestureDetector(
          onTap: () {
            switch (i) {
              case 0:
                nextScreen(context, Categories(search: womenList));
                break;
              case 1:
                nextScreen(context, Categories(search: menList));
                break;
              case 2:
                nextScreen(context, Categories(search: const []));
                break;
              case 3:
                nextScreen(context, Categories(search: const []));
                break;
              case 4:
                nextScreen(context, Categories(search: homeList));
                break;
              default:
                nextScreen(context, Categories(search: const []));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: mainColor)
            ),
            child: Center(child: Text(category[i],style:const TextStyle(color: mainColor,fontSize: 18),)),
          ),
        ))
      ),
    );
  }
}
