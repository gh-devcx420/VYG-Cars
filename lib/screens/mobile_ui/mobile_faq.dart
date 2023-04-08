import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class MobileFaq extends StatefulWidget {
  const MobileFaq({Key? key}) : super(key: key);

  @override
  State<MobileFaq> createState() => _MobileFaqState();
}

class _MobileFaqState extends State<MobileFaq> {
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
