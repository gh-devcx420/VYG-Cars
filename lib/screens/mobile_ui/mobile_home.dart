import 'package:flutter/material.dart';
import 'package:vygcars/utils/constants.dart';
import 'package:vygcars/screens/classes.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackGroundColour,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [
            Header(),
            ImageStack1(),
            HowToRent(),
            CircleImageSteps(),
            ImageStack2(),
            WhatWeOffer(),
            DownloadOurApp(),
            Testimonials(),
            HappyClients(),
            OurServices()
          ],
        ),
      ),
    );
  }
}
