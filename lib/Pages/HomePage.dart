
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNext = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home"),);
    // return Center(
    //     child: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       TextField(
    //         decoration: InputDecoration(
    //             border: OutlineInputBorder(
    //               borderSide: const BorderSide(color: Colors.grey),
    //               borderRadius: BorderRadius.circular(5),
    //             ),
    //             prefixIcon: const Icon(Icons.search),
    //             prefixIconColor: Colors.grey,
    //             hintText: "search for shoes",
    //             suffixIcon: const Icon(Icons.camera_alt_outlined,
    //                 color: Colors.black45)),
    //       ),
    //       height(5),
    //       AnimatedCrossFade(
    //           firstChild: Image.asset(
    //             "assets/1.jpg",
    //             width: double.infinity,
    //             height: 200,
    //             fit: BoxFit.fill,
    //           ),
    //           secondChild: Image.asset(
    //             "assets/Hangman.jpg",
    //             width: double.infinity,
    //             height: 200,
    //             fit: BoxFit.fill,
    //           ),
    //           crossFadeState:
    //               isNext ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    //           duration: const Duration(seconds: 1)),
    //       Flexible(
    //           child: ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: 10,
    //               itemBuilder: (_, index) => Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: SizedBox(
    //                       child: Column(
    //                         children: const [
    //                           CircleAvatar(
    //                             backgroundColor: mainColor,
    //                             radius: 30,
    //                           ),
    //                           Text("Women")
    //                         ],
    //                       ),
    //                     ),
    //                   ))),
    //       const Text("Recently viewd Stores", style: TextStyle(fontSize: 20)),
    //       Flexible(
    //           child: ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: 10,
    //               itemBuilder: (_, index) => Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: SizedBox(
    //                       height: 110,
    //                       child: Card(
    //                         child: Column(
    //                           mainAxisSize: MainAxisSize.min,
    //                           children: [
    //                             Container(
    //                               height: 100,
    //                               width: 80,
    //                               decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.circular(5),
    //                                   gradient: LinearGradient(
    //                                     colors: [
    //                                       mainColor,
    //                                       mainColor.withOpacity(0.5)
    //                                     ],
    //                                   )),
    //                             ),
    //                             const Text("T-shirt")
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )))
    //     ],
    //   ),
    // ));
  }
}
