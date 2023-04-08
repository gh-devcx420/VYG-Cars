import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class TabletPrivacyPolicy extends StatefulWidget {
  const TabletPrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<TabletPrivacyPolicy> createState() => _TabletPrivacyPolicyState();
}

class _TabletPrivacyPolicyState extends State<TabletPrivacyPolicy> {
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
              PrivacyPolicyContents(),
              OurServices(),
            ],
          ),
        ),
      ),
    );
  }
}