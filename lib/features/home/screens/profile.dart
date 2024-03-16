import 'package:app2/core/theme.dart';
import 'package:app2/features/themes/themess.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeProvider>(context, listen: false)
            .currentTheme
            .primaryColor,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Center(
            child: Text(
          'Ahmed Sabry',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        const Text(
          'sabahmed81@gmail.com',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        bodyconatiner(
            iconss: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colors.blue.shade900,
                  size: 30,
                )),
            text: 'Edit Profile',
            onTab: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Themespages();
              }));
            }),
        bodyconatiner(
            iconss: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.blue.shade900,
                  size: 30,
                )),
            text: 'Edit Profile',
            onTab: () {}),
        bodyconatiner(
            iconss: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                  color: Colors.blue.shade900,
                  size: 30,
                )),
            text: 'Edit Profile',
            onTab: () {}),
        bodyconatiner(
            iconss: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Colors.blue.shade900,
                  size: 30,
                )),
            text: 'Edit Profile',
            onTab: () {}),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.exit_to_app,
              color: Colors.red.shade900,
              size: 30,
            ),
            Text(
              'Logout',
              style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ]),
        )
      ]),
    );
  }
}

Widget bodyconatiner(
    {required IconButton iconss,
    required String text,
    required Function onTab}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        onTab();
      },
      child: Container(
        height: 80,
        width: 380,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xfff3e9f6),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: iconss,
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color(0xffcaaada),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.blue.shade900,
                size: 20,
              ),
            ),
          )
        ]),
      ),
    ),
  );
}
