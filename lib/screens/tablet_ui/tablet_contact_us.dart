import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class TabletContactUs extends StatefulWidget {
  const TabletContactUs({Key? key}) : super(key: key);

  @override
  State<TabletContactUs> createState() => _TabletContactUsState();
}

class _TabletContactUsState extends State<TabletContactUs> {
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
              ContactUsContents(),
              OurServices(),
            ],
          ),
        ),
      ),
    );
  }
}