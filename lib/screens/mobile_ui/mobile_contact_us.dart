import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class MobileContactUs extends StatefulWidget {
  const MobileContactUs({Key? key}) : super(key: key);

  @override
  State<MobileContactUs> createState() => _MobileContactUsState();
}

class _MobileContactUsState extends State<MobileContactUs> {
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
