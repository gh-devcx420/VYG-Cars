import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class MobilePrivacyPolicy extends StatefulWidget {
  const MobilePrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<MobilePrivacyPolicy> createState() => _MobilePrivacyPolicyState();
}

class _MobilePrivacyPolicyState extends State<MobilePrivacyPolicy> {
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