import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vygcars/screens/classes.dart';
import 'package:vygcars/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DesktopAboutUs extends StatefulWidget {
  const DesktopAboutUs({Key? key}) : super(key: key);

  @override
  State<DesktopAboutUs> createState() => _DesktopAboutUsState();
}

class _DesktopAboutUsState extends State<DesktopAboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainBackGroundColour,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Header(),
              AboutUsContents(),
              OurServices(),
            ],
          ),
        ),
      ),
    );
  }
}
