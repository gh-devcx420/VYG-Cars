import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class DesktopContactUs extends StatefulWidget {
  const DesktopContactUs({Key? key}) : super(key: key);

  @override
  State<DesktopContactUs> createState() => _DesktopContactUsState();
}

class _DesktopContactUsState extends State<DesktopContactUs> {
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