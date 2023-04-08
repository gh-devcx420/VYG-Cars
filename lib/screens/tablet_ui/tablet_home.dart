import 'package:flutter/material.dart';
import 'package:vygcars/utils/constants.dart';
import 'package:vygcars/screens/classes.dart';

class TabletHome extends StatefulWidget {
  const TabletHome({Key? key}) : super(key: key);

  @override
  State<TabletHome> createState() => _TabletHomeState();
}

class _TabletHomeState extends State<TabletHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainBackGroundColour,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              Header(),
              ImageStack1(),
              HowToRent(),
              CircleImageSteps(), //here
              ImageStack2(),
              WhatWeOffer(),
              DownloadOurApp(),
              Testimonials(),
              HappyClients(),
              OurServices()
            ],
          ),
        ),
      ),
    );
  }
}
