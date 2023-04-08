import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class TabletFaq extends StatefulWidget {
  const TabletFaq({Key? key}) : super(key: key);

  @override
  State<TabletFaq> createState() => _TabletFaqState();
}

class _TabletFaqState extends State<TabletFaq> {
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
              FAQ(),
              OurServices(),
            ],
          ),
        ),
      ),
    );
  }
}