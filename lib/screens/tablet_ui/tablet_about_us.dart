import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class TabletAboutUs extends StatefulWidget {
  const TabletAboutUs({Key? key}) : super(key: key);

  @override
  State<TabletAboutUs> createState() => _TabletAboutUsState();
}

class _TabletAboutUsState extends State<TabletAboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainBackGroundColour,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              Header(),
              AboutUsContents(),
              OurServices(),
            ],
          ),
        ),
      ),
    );
  }
}