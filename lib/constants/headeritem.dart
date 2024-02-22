import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      height: deviceHeight / 3,
      decoration: const BoxDecoration(
          color: Colors.purple,
          image: DecorationImage(
              image: AssetImage("lib/assets/images/header.png"),
              fit: BoxFit.cover)),
      child: const Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "October 20,2022",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            "My Todo List",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
