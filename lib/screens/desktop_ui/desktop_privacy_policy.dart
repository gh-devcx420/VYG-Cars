import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';

class DesktopPrivacyPolicy extends StatefulWidget {
  const DesktopPrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<DesktopPrivacyPolicy> createState() => _DesktopPrivacyPolicyState();
}

class _DesktopPrivacyPolicyState extends State<DesktopPrivacyPolicy> {
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