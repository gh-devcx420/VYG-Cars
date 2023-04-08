import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class DesktopFaq extends StatefulWidget {
  const DesktopFaq({Key? key}) : super(key: key);

  @override
  State<DesktopFaq> createState() => _DesktopFaqState();
}

class _DesktopFaqState extends State<DesktopFaq> {
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