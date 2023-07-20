import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            Container(
                height: 150,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/icon1.png"),
                          radius: 50,
                        )),
                    const Text("Guest234")
                  ],
                )),
            const ListTile(
                title: Text("My Earnings"),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 25,
                  color: mainColor,
                )),
            const ListTile(
              title: Text("My Bank Account"),
              trailing: Icon(
                Icons.chevron_right,
                size: 25,
                color: mainColor,
              ),
            ),
            const ListTile(
              title: Text("My Orders"),
              trailing: Icon(
                Icons.chevron_right,
                size: 25,
                color: mainColor,
              ),
            ),
            const ListTile(
              title: Text("My Wishlists"),
              trailing: Icon(
                Icons.chevron_right,
                size: 25,
                color: mainColor,
              ),
            ),
            const ListTile(
              title: Text("My Reviews"),
              trailing: Icon(
                Icons.chevron_right,
                size: 25,
                color: mainColor,
              ),
            ),
            const Divider(),
            const ListTile(
              title: Text("VStore Rewards"),
              leading: Icon(
                Icons.card_giftcard,
                size: 25,
                color: mainColor,
              ),
            ),
            const ListTile(
              title: Text("Contact Us"),
              leading: Icon(
                Icons.call,
                size: 25,
                color: mainColor,
              ),
            ),
            const ListTile(
              title: Text("Help Center"),
              leading: Icon(
                Icons.help_outline,
                size: 25,
                color: mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
