import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class MobileAboutUs extends StatefulWidget {
  const MobileAboutUs({Key? key}) : super(key: key);

  @override
  State<MobileAboutUs> createState() => _MobileAboutUsState();
}

class _MobileAboutUsState extends State<MobileAboutUs> {
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