import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vygcars/utils/functions.dart';
import 'package:vygcars/utils/lists.dart';
import 'package:vygcars/utils/widgets.dart';
import 'package:vygcars/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//1. Class used to build a header bar using provided arguments/styles.
class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.01,
            vertical: VYGDimension.isMobile(constraints, 0.04, 0.02),
          ),
          child: Row(
            mainAxisAlignment: constraints.maxWidth < 650
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FirmLogo(constraints: constraints),
              constraints.maxWidth < 650
                  ? HeaderContentsMobileView(
                      constraints: constraints,
                    )
                  : HeaderContentsWebView(
                      constraints: constraints,
                    ),
            ],
          ),
        );
      },
    );
  }
}

//2. Class used to build a stack on top of Image Carousel just below the Header.
class ImageStack1 extends StatelessWidget {
  const ImageStack1({
    super.key,
  });

  List<Widget> generateImages() {
    return carImagePath
        .map<Widget>(
          (element) => ClipRRect(
            child: Image.asset(
              element,
              fit: BoxFit.fill,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.overlay,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            CarouselSlider(
              items: generateImages(),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(
                  seconds: 5,
                ),
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 16 / 9,
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        //height: constraints.maxWidth * 0.13,
                        height: VYGDimension.isMobile(constraints, 0.08, 0.12),
                      ),
                      Text(
                        "Awesome Services",
                        style: GoogleFonts.ptSans(
                          fontSize: VYGDimension.isAll(
                              constraints, 0.03, 0.018, 0.015),
                          fontWeight: FontWeight.w900,
                          color: kTextColourDeepPurple,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxWidth * 0.01,
                      ),
                      Text(
                        "Rent A Car",
                        style: GoogleFonts.ptSans(
                          fontSize:
                              VYGDimension.isMobile(constraints, 0.06, 0.06),
                          fontWeight: FontWeight.w900,
                          color: kTextColourWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

//3. Class used to build a Row that shows "how to rent" steps below Image Carousel.
class HowToRent extends StatelessWidget {
  const HowToRent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.06,
            vertical: constraints.maxWidth * 0.015,
          ),
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxWidth * 0.04,
              ),
              Text(
                "How To Rent?",
                style: GoogleFonts.ptSans(
                  color: kTextColourDeepPurple,
                  fontSize: VYGDimension.isAll(constraints, 0.03, 0.018, 0.015),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.94,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: VYGDimension.isMobile(constraints, 0.02, 0.010),
                ),
                child: Text(
                  "Make 4 Simple Steps To Rent a Car!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    color: kTextColourIndigo,
                    fontSize: VYGDimension.isMobile(constraints, 0.06, 0.06),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxWidth * 0.02,
              ),
              SizedBox(
                width: VYGDimension.isMobile(constraints, 0.8, 0.6),
                child: Text(
                  "Find car rentals at over 2900 locations in the country from $kFirmName. "
                  "It’s easy to rent a car!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    fontSize:
                        VYGDimension.isAll(constraints, 0.030, 0.018, 0.014),
                    fontWeight: FontWeight.w600,
                    color: kTextColourGrey,
                    letterSpacing: 0.85,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxWidth * 0.02,
              ),
            ],
          ),
        );
      },
    );
  }
}

//4. Class used to build a Row that displays the "Steps To Rent A Car".
class CircleImageSteps extends StatelessWidget {
  const CircleImageSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: VYGDimension.isMobile(constraints, 2.8, 0.22),
              width: constraints.maxWidth * 0.90,
              child: ListView.builder(
                  scrollDirection: constraints.maxWidth < 650
                      ? Axis.vertical
                      : Axis.horizontal,
                  physics: constraints.maxWidth < 650
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  itemCount: circleImageContentsList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: constraints.maxWidth < 650
                          ? const Alignment(0, 0.8)
                          : const Alignment(0, 4),
                      children: [
                        Container(
                          height: VYGDimension.isMobile(constraints, 0.6, 0.20),
                          width: VYGDimension.isMobile(constraints, 0.6, 0.20),
                          margin: EdgeInsets.all(
                            VYGDimension.isMobile(constraints, 0.02, 0.01),
                          ),
                          decoration: BoxDecoration(
                            color: kWhiteVyg,
                            borderRadius: BorderRadius.circular(
                              VYGDimension.isMobile(constraints, 0.6, 0.20),
                            ),
                          ),
                          alignment: const Alignment(-0.8, -0.95),
                          child: Container(
                            height:
                                VYGDimension.isMobile(constraints, 0.1, 0.035),
                            width:
                                VYGDimension.isMobile(constraints, 0.1, 0.035),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                VYGDimension.isMobile(constraints, 0.1, 0.035),
                              ),
                              color: kSecondaryColour,
                            ),
                            child: Center(
                              child: Text(
                                circleImageContentsList[index]
                                    .buttonNumber
                                    .toString(),
                                style: GoogleFonts.ptSans(
                                  color: kWhiteVyg,
                                  fontSize: VYGDimension.isMobile(
                                      constraints, 0.05, 0.016),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: VYGDimension.isMobile(constraints, 0.5, 0.20),
                          width: VYGDimension.isMobile(constraints, 0.5, 0.20),
                          child: Column(
                            children: [
                              Icon(
                                circleImageContentsList[index].buttonIcon,
                                size: VYGDimension.isMobile(
                                    constraints, 0.12, 0.03),
                                color: kIconColourIndigo,
                              ),
                              SizedBox(
                                height: VYGDimension.isMobile(
                                    constraints, 0.03, 0.010),
                              ),
                              Text(
                                circleImageContentsList[index].buttonLabel,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.ptSans(
                                  color: kTextColourIndigo,
                                  fontSize: VYGDimension.isMobile(
                                      constraints, 0.06, 0.018),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: VYGDimension.isMobile(
                                    constraints, 0.02, 0.012),
                              ),
                              SizedBox(
                                width: VYGDimension.isMobile(
                                    constraints, 0.6, 0.15),
                                child: Text(
                                  circleImageContentsList[index]
                                      .buttonDescription,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.ptSans(
                                    color: kTextColourGrey,
                                    fontSize: VYGDimension.isMobile(
                                        constraints, 0.035, 0.014),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}

//5. Class used to build a Stack on top of a Static Image displayed under "Steps To Rent a Car".
class ImageStack2 extends StatelessWidget {
  const ImageStack2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          SizedBox(height: constraints.maxWidth * 0.05),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/car3.jpg',
                  fit: BoxFit.fill,
                ),
                ClipRRect(
                  // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                VYGDimension.isMobile(constraints, 0.06, 0.12),
                          ),
                          Text(
                            "Get a First-Time 10% discount",
                            style: GoogleFonts.ptSans(
                              fontSize: VYGDimension.isAll(
                                  constraints, 0.03, 0.018, 0.015),
                              fontWeight: FontWeight.w600,
                              color: kTextColourDeepPurple,
                              letterSpacing: 0.94,
                            ),
                          ),
                          SizedBox(
                            width:
                                VYGDimension.isMobile(constraints, 0.95, 0.6),
                            child: Text(
                              "45,000 people use $kFirmName service.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ptSans(
                                fontSize: VYGDimension.isMobile(
                                    constraints, 0.06, 0.06),
                                fontWeight: FontWeight.w900,
                                color: kTextColourWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.025,
                          ),
                          Container(
                            height: VYGDimension.isMobile(
                                constraints, 0.006, 0.002),
                            width:
                                VYGDimension.isMobile(constraints, 0.3, 0.08),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kSecondaryColour,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.025,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.8,
                            child: Text(
                              "Contact us now via our website & get a First-Time 10% discount and enjoy it!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ptSans(
                                fontSize: VYGDimension.isMobile(
                                    constraints, 0.028, 0.018),
                                fontWeight: FontWeight.w600,
                                color: kTextColourWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.04,
                          ),
                          Button(
                            buttonHeight:
                                VYGDimension.isMobile(constraints, 0.1, 0.05),
                            buttonWidth:
                                VYGDimension.isMobile(constraints, 0.35, 0.20),
                            buttonColour: kSecondaryColour,
                            buttonChild: Text(
                              'Contact Us Now!',
                              style: GoogleFonts.ptSans(
                                fontSize: VYGDimension.isMobile(
                                    constraints, 0.025, 0.018),
                                fontWeight: FontWeight.w600,
                                color: kTextColourWhite,
                              ),
                            ),
                            onButtonTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

//6. Class used to build a Row that displays "What we offer" section below Static Image.
class WhatWeOffer extends StatelessWidget {
  const WhatWeOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxWidth * 0.08,
            ),
            Text(
              "What We Offer?",
              style: GoogleFonts.ptSans(
                color: kTextColourDeepPurple,
                fontSize: VYGDimension.isAll(constraints, 0.03, 0.018, 0.015),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.94,
              ),
            ),
            Text(
              "Explore the Car Range!",
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                color: kTextColourIndigo,
                fontSize: VYGDimension.isMobile(constraints, 0.06, 0.06),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: constraints.maxWidth * 0.04,
            ),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 1.40, 0.58),
              width: VYGDimension.isMobile(constraints, 0.9, 0.88),
              //color: Colors.yellow,
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  addAutomaticKeepAlives: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: carModelItemList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: const Alignment(-0.78, -0.9),
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(
                                VYGDimension.isMobile(constraints, 0.02, 0.01),
                              ),
                              height: VYGDimension.isMobile(
                                  constraints, 1.30, 0.47),
                              width: VYGDimension.isMobile(
                                  constraints, 0.8, 0.271),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: VYGDimension.isMobile(
                                        constraints, 0.22, 0.07),
                                  ),
                                  SizedBox(
                                    //color: Colors.red.withOpacity(0.2),
                                    height: VYGDimension.isAll(
                                        constraints, 0.4, 0.15, 0.15),
                                    width: VYGDimension.isAll(
                                        constraints, 0.66, 0.24, 0.24),
                                    child: Image.asset(
                                      carModelItemList[index].carModelImagePath,
                                    ),
                                  ),
                                  Text(
                                    carModelItemList[index].carName,
                                    style: GoogleFonts.ptSans(
                                      fontSize: VYGDimension.isMobile(
                                          constraints, 0.075, 0.025),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: VYGDimension.isMobile(
                                        constraints, 0.01, 0.004),
                                  ),
                                  Text(
                                    carModelItemList[index].carType,
                                    style: GoogleFonts.ptSans(
                                      fontSize: VYGDimension.isMobile(
                                          constraints, 0.05, 0.018),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: VYGDimension.isMobile(
                                        constraints, 0.05, 0.02),
                                  ),
                                  Button(
                                    buttonHeight: VYGDimension.isMobile(
                                        constraints, 0.12, 0.05),
                                    buttonWidth: VYGDimension.isMobile(
                                        constraints, 0.40, 0.18),
                                    buttonColour: kSecondaryColour,
                                    buttonChild: Text(
                                      "View Details",
                                      style: GoogleFonts.ptSans(
                                        fontSize: VYGDimension.isAll(
                                            constraints, 0.04, 0.018, 0.018),
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onButtonTap: () {},
                                  ),
                                  SizedBox(
                                    height: VYGDimension.isMobile(
                                        constraints, 0.06, 0.03),
                                  ),
                                  Container(
                                    height: 1.8,
                                    width: VYGDimension.isMobile(
                                        constraints, 0.62, 0.18),
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: VYGDimension.isMobile(
                                        constraints, 0.04, 0.008),
                                  ),
                                  SizedBox(
                                    height: VYGDimension.isAll(
                                        constraints, 0.16, 0.06, 0.05),
                                    width: VYGDimension.isAll(
                                        constraints, 0.62, 0.2, 0.2),
                                    //color: Colors.green,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CarInfoChip(
                                          constraints: constraints,
                                          pathNumber: 0,
                                          chipInfoDetailNumber:
                                              carModelItemList[index]
                                                  .noOfPassengers
                                                  .toString(),
                                        ),
                                        CarInfoChip(
                                          constraints: constraints,
                                          pathNumber: 1,
                                          chipInfoDetailNumber:
                                              carModelItemList[index]
                                                  .transmissionType,
                                        ),
                                        CarInfoChip(
                                          constraints: constraints,
                                          pathNumber: 2,
                                          chipInfoDetailNumber:
                                              carModelItemList[index]
                                                  .doorCount
                                                  .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height:
                              VYGDimension.isAll(constraints, 0.18, 0.06, 0.06),
                          width:
                              VYGDimension.isAll(constraints, 0.18, 0.06, 0.06),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              VYGDimension.isMobile(constraints, 0.04, 0.018),
                            ),
                            color: kSecondaryColour.withOpacity(0.9),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                carModelItemList[index].carRentPrice.toString(),
                                style: GoogleFonts.ptSans(
                                  fontSize: VYGDimension.isMobile(
                                      constraints, 0.08, 0.025),
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Per Day",
                                style: GoogleFonts.ptSans(
                                  fontSize: VYGDimension.isMobile(
                                      constraints, 0.04, 0.012),
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}

//7. Class used to build a row that displays "Download Our App" section.
class DownloadOurApp extends StatelessWidget {
  const DownloadOurApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: VYGDimension.isMobile(constraints, 1.5, 0.5),
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: kWhiteVyg,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.zero,
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(
                constraints.maxWidth < 650 ? 20 : 50,
              ),
              topRight: Radius.circular(
                constraints.maxWidth < 650 ? 20 : 50,
              ),
            ),
          ),
          child: constraints.maxWidth < 650
              ? Column(
                  children: [
                    SizedBox(
                      height: constraints.maxWidth * 0.05,
                    ),
                    Stack(
                      alignment: const Alignment(0, 0),
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.9,
                          //color: Colors.red.shade50,
                          child: Image.asset(
                            'assets/images/world-map-dotted.png',
                          ),
                        ),
                        Stack(
                          alignment: const Alignment(-2.2, -0.4),
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.35,
                              child: Image.asset(
                                'assets/images/vygscreenshot.png',
                              ),
                            ),
                            Container(
                              height: constraints.maxWidth * 0.2,
                              width: constraints.maxWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * 0.2,
                                ),
                                color: kSecondaryColour,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Get it for',
                                    style: GoogleFonts.ptSans(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: kTextColourWhite,
                                    ),
                                  ),
                                  Text(
                                    'Free',
                                    style: GoogleFonts.ptSans(
                                      fontSize: constraints.maxWidth * 0.025,
                                      fontWeight: FontWeight.w600,
                                      color: kTextColourWhite,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.06,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Download Our App",
                          style: GoogleFonts.ptSans(
                            color: kTextColourDeepPurple,
                            fontSize: constraints.maxWidth * 0.03,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.94,
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.35,
                          //color: Colors.green,
                          child: Text(
                            "Use One Way Car Rental!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ptSans(
                              color: kTextColourIndigo,
                              fontSize: constraints.maxWidth * 0.06,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxWidth * 0.02,
                        ),
                        Container(
                          height: constraints.maxWidth * 0.003,
                          width: constraints.maxWidth * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: kSecondaryColour,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxWidth * 0.035,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.8,
                          child: Text(
                            "We go with the fastest options only! Rent a car right away without having to wait in long lines & filling the paperwork, and receive it within 60 minutes. "
                            "This is the most efficient and elegant way of doing car rent business!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ptSans(
                              fontSize: VYGDimension.isAll(
                                  constraints, 0.030, 0.018, 0.014),
                              fontWeight: FontWeight.w600,
                              color: kTextColourGrey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxWidth * 0.08,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.8,
                          //color: Colors.pink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Button(
                                buttonHeight: constraints.maxWidth * 0.12,
                                buttonWidth: constraints.maxWidth * 0.35,
                                buttonColour: kSecondaryColour,
                                buttonChild: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.03),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.apple,
                                        size: constraints.maxWidth * 0.065,
                                        color: kTextColourWhite,
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.015,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' Download on the',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.02,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourWhite,
                                            ),
                                          ),
                                          Text(
                                            'Apple Store',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.035,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onButtonTap: () {
                                  VYGFunctions.launchLink(
                                      "https://www.apple.com/in/app-store/");
                                },
                              ),
                              Button(
                                buttonHeight: constraints.maxWidth * 0.12,
                                buttonWidth: constraints.maxWidth * 0.35,
                                buttonColour: kMainBackGroundColour,
                                buttonChild: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.03,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.googlePlay,
                                        size: VYGDimension.isMobile(
                                            constraints, 0.06, 0.02),
                                        color: kTextColourIndigo,
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.015,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' Get it on',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.02,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourIndigo,
                                            ),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * 0.08,
                                          ),
                                          Text(
                                            'Google Play',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.035,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourIndigo,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onButtonTap: () {
                                  VYGFunctions.launchLink(
                                      "https://play.google.com/store/apps/details?id=com.moonlight.vyg_car");
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              : Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.03,
                    ),
                    Stack(
                      alignment: const Alignment(0, 0),
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.55,
                          height: constraints.maxWidth * 0.5,
                          child: Image.asset(
                            'assets/images/world-map-dotted.png',
                          ),
                        ),
                        Stack(
                          alignment: const Alignment(-1.05, -0.6),
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.25,
                              height: constraints.maxWidth / 2.6,
                              child: Image.asset(
                                'assets/images/vygscreenshot.png',
                              ),
                            ),
                            Container(
                              height: constraints.maxWidth * 0.08,
                              width: constraints.maxWidth * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * 0.08,
                                ),
                                color: kSecondaryColour,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Get it for',
                                    style: GoogleFonts.ptSans(
                                      fontSize: constraints.maxWidth * 0.01,
                                      fontWeight: FontWeight.w600,
                                      color: kTextColourWhite,
                                    ),
                                  ),
                                  Text(
                                    'Free',
                                    style: GoogleFonts.ptSans(
                                      fontSize: constraints.maxWidth * 0.025,
                                      fontWeight: FontWeight.w600,
                                      color: kTextColourWhite,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Download Our App",
                          style: GoogleFonts.ptSans(
                            color: kTextColourDeepPurple,
                            fontSize: VYGDimension.isAll(
                                constraints, 0.03, 0.018, 0.015),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.94,
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.35,
                          //color: Colors.green,
                          child: Text(
                            "Use One Way Car Rental!",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ptSans(
                              color: kTextColourIndigo,
                              fontSize: VYGDimension.isMobile(
                                  constraints, 0.06, 0.06),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxWidth * 0.02,
                        ),
                        Container(
                          height: constraints.maxWidth * 0.002,
                          width: constraints.maxWidth * 0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: kSecondaryColour,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxWidth * 0.035,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.35,
                          child: Text(
                            "We go with the fastest options only! Rent a car right away without having to wait in long lines & filling the paperwork, and receive it within 60 minutes. "
                            "This is the most efficient and elegant way of doing car rent business!",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ptSans(
                              fontSize: VYGDimension.isAll(
                                  constraints, 0.030, 0.018, 0.014),
                              fontWeight: FontWeight.w600,
                              color: kTextColourGrey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxWidth * 0.02,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                buttonHeight: constraints.maxWidth * 0.04,
                                buttonWidth: constraints.maxWidth * 0.14,
                                buttonColour: kSecondaryColour,
                                buttonChild: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.015,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.apple,
                                        size: constraints.maxWidth * 0.028,
                                        color: kTextColourWhite,
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.005,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Download on the',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.008,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourWhite,
                                            ),
                                          ),
                                          Text(
                                            'Apple Store',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.012,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onButtonTap: () {
                                  VYGFunctions.launchLink(
                                      "https://www.apple.com/in/app-store/");
                                },
                              ),
                              Button(
                                buttonHeight: constraints.maxWidth * 0.04,
                                buttonWidth: constraints.maxWidth * 0.14,
                                buttonColour: kMainBackGroundColour,
                                buttonChild: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.015),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.googlePlay,
                                        size: constraints.maxWidth * 0.02,
                                        color: kTextColourIndigo,
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.005,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Get it on',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.008,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourIndigo,
                                            ),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * 0.08,
                                          ),
                                          Text(
                                            'Google Play',
                                            style: GoogleFonts.ptSans(
                                              fontSize:
                                                  constraints.maxWidth * 0.012,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColourIndigo,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onButtonTap: () {
                                  VYGFunctions.launchLink(
                                      "https://play.google.com/store/apps/details?id=com.moonlight.vyg_car");
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
        );
      },
    );
  }
}

//8. Class used to build a row that displays "Testimonials" section.
class Testimonials extends StatelessWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxWidth * 0.04,
            ),
            Text(
              "Testimonials",
              style: GoogleFonts.ptSans(
                color: kTextColourDeepPurple,
                fontSize: VYGDimension.isAll(constraints, 0.03, 0.018, 0.015),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.94,
              ),
            ),
            Text(
              "Clients : About Us",
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                color: kTextColourIndigo,
                fontSize: VYGDimension.isMobile(constraints, 0.06, 0.06),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: constraints.maxWidth * 0.04,
            ),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 2.28, 0.50),
              width: VYGDimension.isMobile(constraints, 0.8, 0.88),
              //color: Colors.yellow,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                addAutomaticKeepAlives: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: constraints.maxWidth < 650
                    ? Axis.vertical
                    : Axis.horizontal,
                itemCount: clientReviewList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(
                      VYGDimension.isMobile(constraints, 0.02, 0.01),
                    ),
                    width: VYGDimension.isMobile(constraints, 0.6, 0.271),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            VYGDimension.isMobile(constraints, 0.05, 0.018),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                VYGDimension.isMobile(constraints, 0.04, 0.03),
                          ),
                          CircleAvatar(
                            radius: VYGDimension.isAll(
                                constraints, 0.104, 0.082, 0.082),
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: VYGDimension.isAll(
                                  constraints, 0.1, 0.08, 0.08),
                              backgroundImage: AssetImage(
                                clientReviewList[index].clientImagePath,
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                VYGDimension.isMobile(constraints, 0.02, 0.025),
                          ),
                          Text(
                            clientReviewList[index].clientReview,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ptSans(
                              fontSize: VYGDimension.isMobile(
                                  constraints, 0.04, 0.016),
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height:
                                VYGDimension.isMobile(constraints, 0.01, 0.02),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "- ${clientReviewList[index].clientName}",
                                    style: GoogleFonts.ptSans(
                                      fontSize: VYGDimension.isMobile(
                                          constraints, 0.04, 0.025),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    width: VYGDimension.isMobile(
                                        constraints, 0.01, 0.05),
                                  ),
                                  Text(
                                    "${clientReviewList[index].clientAge} Years",
                                    style: GoogleFonts.ptSans(
                                      fontSize: VYGDimension.isMobile(
                                          constraints, 0.028, 0.012),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height:
                                VYGDimension.isMobile(constraints, 0.04, 0.02),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: constraints.maxWidth * 0.04,
            ),
          ],
        );
      },
    );
  }
}

//9. Class used to build a row that displays how many clients trust us.
class HappyClients extends StatelessWidget {
  const HappyClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: VYGDimension.isMobile(constraints, 0.3, 0.20),
          width: VYGDimension.isMobile(constraints, 0.8, 0.8),
          padding: EdgeInsets.symmetric(
            horizontal: VYGDimension.isMobile(constraints, 0.05, 0.10),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              VYGDimension.isMobile(constraints, 0.04, 0.02),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "98%",
                style: GoogleFonts.ptSans(
                    fontSize: VYGDimension.isMobile(constraints, 0.08, 0.08),
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.04,
              ),
              SizedBox(
                width: VYGDimension.isMobile(constraints, 0.45, 0.35),
                //color: Colors.yellow,
                child: Text(
                  " of all our clients were happy to use our services and would have us back.",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.ptSans(
                      fontSize: VYGDimension.isMobile(constraints, 0.03, 0.022),
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//10. Class used to build a row that displays our services along with our contact info.
class OurServices extends StatelessWidget {
  const OurServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: VYGDimension.isMobile(constraints, 0.65, 0.4),
          width: constraints.maxWidth,
          padding: EdgeInsets.only(
            top: constraints.maxWidth * 0.04,
            bottom: constraints.maxWidth * 0.04,
          ),
          margin: EdgeInsets.only(
            top: constraints.maxWidth * 0.04,
            bottom: constraints.maxWidth * 0.04,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topLeft: Radius.zero,
              topRight: Radius.zero,
            ),
          ),
          child: Column(
            children: [
              FirmLogo(constraints: constraints),
              SizedBox(
                height: VYGDimension.isMobile(constraints, 0.04, 0.02),
              ),
              SizedBox(
                width: VYGDimension.isMobile(constraints, 0.8, 0.7),
                child: Text(
                  "With so many options for rental service, "
                  "you must choose the best company."
                  " We give you a wide range of quality rides!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    fontSize:
                        VYGDimension.isAll(constraints, 0.030, 0.018, 0.014),
                    fontWeight: FontWeight.w600,
                    color: kTextColourGrey,
                  ),
                ),
              ),
              SizedBox(
                height: VYGDimension.isMobile(constraints, 0.04, 0.04),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VYGFunctions.buildSocialButton(
                    constraints,
                    FontAwesomeIcons.facebook,
                    () {
                      VYGFunctions.launchLink('https://www.facebook.com/VYGcar');
                    },
                  ),
                  VYGFunctions.buildSocialButton(
                    constraints,
                    FontAwesomeIcons.linkedin,
                    () {
                      VYGFunctions.launchLink(
                          'https://www.linkedin.com/company/vygtech/');
                    },
                  ),
                  VYGFunctions.buildSocialButton(
                    constraints,
                    FontAwesomeIcons.instagram,
                    () {
                      VYGFunctions.launchLink('https://instagram.com/vygcar');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: VYGDimension.isMobile(constraints, 0.04, 0.04),
              ),
              InkWell(
                onTap: () {
                  VYGFunctions.launchLink(
                      'https://moonlighttechnolog.wixsite.com/moonlight-technology');
                },
                child: Text(
                  "Powered By : MoonLight Technologies",
                  style: GoogleFonts.ptSans(
                    fontSize:
                        VYGDimension.isAll(constraints, 0.025, 0.016, 0.015),
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColour,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//11. Class used to build a section that displays About Us Section's Body from firebase.
class AboutUsContents extends StatelessWidget {
  const AboutUsContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: VYGDimension.isMobile(
            constraints,
            0.1,
            0.05,
          ),
        ),
        child: Column(
          children: [
            Text(
              "About Us",
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                color: kTextColourDeepPurple,
                fontSize: VYGDimension.isAll(constraints, 0.03, 0.018, 0.015),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.94,
              ),
            ),
            Container(
              width: constraints.maxWidth * 0.35,
              //color: Colors.green,
              child: Text(
                "About Us",
                textAlign: TextAlign.center,
                style: GoogleFonts.ptSans(
                  color: kTextColourIndigo,
                  fontSize: VYGDimension.isMobile(constraints, 0.06, 0.06),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 0.1, 0.05),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('aboutUS')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CupertinoActivityIndicator(radius: 20),
                    );
                  } else {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Text(
                          snapshot.data!.docs[index].get("aboutUS"),
                          style: GoogleFonts.ptSans(
                            fontSize: VYGDimension.isAll(
                                constraints, 0.030, 0.018, 0.014),
                            fontWeight: FontWeight.w600,
                            color: kTextColourGrey,
                            letterSpacing: 0.85,
                          ),
                        );
                      },
                    );
                  }
                }),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 0.1, 0.05),
            ),
          ],
        ),
      );
    });
  }
}

//12. Class used to build a section that displays FAQ section in FAQ page.
class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.only(
            top: constraints.maxWidth * 0.04,
            bottom: constraints.maxWidth * 0.04,
          ),
          child: Column(
            children: [
              Text(
                "FAQ",
                style: GoogleFonts.ptSans(
                  color: kTextColourDeepPurple,
                  fontSize: VYGDimension.isAll(constraints, 0.03, 0.018, 0.015),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.94,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: VYGDimension.isMobile(constraints, 0.02, 0.010),
                ),
                child: Text(
                  "Frequently Asked Questions",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    color: kTextColourIndigo,
                    fontSize: VYGDimension.isMobile(constraints, 0.06, 0.06),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: VYGDimension.isMobile(constraints, 0.1, 0.05),
              ),
              FAQCard(
                constraints: constraints,
                question:
                    "What type of documents should I show to the representatives of a rental company when picking up a car?",
                answer:
                    "Suspendisse sit amet pretium orci. Aliquam erat volutpat. Quisque tortor ipsum, mattis scelerisque vitae, malesuada nulla et ligula porttitor, gravida orci vitae, sollicitudin mi.",
              ),
              FAQCard(
                constraints: constraints,
                question:
                    "Can I cross the border of a country where I rented a car?",
                answer:
                    "Suspendisse sit amet pretium orci. Aliquam erat volutpat. Quisque tortor ipsum, mattis scelerisque vitae, malesuada nulla et ligula porttitor, gravida orci vitae, sollicitudin mi.",
              ),
              FAQCard(
                constraints: constraints,
                question:
                    "What type of documents should I show to the representatives of a rental company when picking up a car?",
                answer:
                    "Suspendisse sit amet pretium orci. Aliquam erat volutpat. Quisque tortor ipsum, mattis scelerisque vitae, malesuada nulla et ligula porttitor, gravida orci vitae, sollicitudin mi.",
              ),
              FAQCard(
                constraints: constraints,
                question:
                    "Can I cross the border of a country where I rented a car?",
                answer:
                    "Suspendisse sit amet pretium orci. Aliquam erat volutpat. Quisque tortor ipsum, mattis scelerisque vitae, malesuada nulla et ligula porttitor, gravida orci vitae, sollicitudin mi.",
              ),
            ],
          ),
        );
      },
    );
  }
}

//13. Class used to build a section that displays Contacts Us Section in Contact Us page.
class ContactUsContents extends StatelessWidget {
  const ContactUsContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: VYGDimension.isMobile(
            constraints,
            0.1,
            0.05,
          ),
        ),
        child: Column(
          children: [
            Text(
              "Contact Us",
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                color: kTextColourDeepPurple,
                fontSize: VYGDimension.isAll(constraints, 0.03, 0.018, 0.015),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.94,
              ),
            ),
            Container(
              width: constraints.maxWidth * 0.30,
              //color: Colors.green,
              child: Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: GoogleFonts.ptSans(
                  color: kTextColourIndigo,
                  fontSize: VYGDimension.isMobile(constraints, 0.06, 0.06),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 0.1, 0.05),
            ),
            Container(
              width: constraints.maxWidth * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContactDetailsColumn(
                    constraints: constraints,
                    headingText: "Address",
                    details: "Gurugram Haryana - 122001",
                    icon: Icons.map_sharp,
                    onIconTap: (){
                      VYGFunctions.launchLink("https://www.google.com/maps/place/Gujarat/@22.2971894,70.7518194,11.17z/");
                    },
                  ),
                  ContactDetailsColumn(
                    constraints: constraints,
                    headingText: "Phone ",
                    details: "+91 8813881100",
                    icon: Icons.phone,
                    onIconTap: (){},
                  ),
                  ContactDetailsColumn(
                    constraints: constraints,
                    headingText: "Email",
                    details: "cs@vygtech.com",
                    icon: Icons.email,
                    onIconTap: (){},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 0.1, 0.05),
            ),
          ],
        ),
      );
    });
  }
}

//14. Class used to build a section that displays Privacy Policy section in Privacy Policy page.
class PrivacyPolicyContents extends StatelessWidget {
  const PrivacyPolicyContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: constraints.maxWidth,
        padding: EdgeInsets.symmetric(
          horizontal: VYGDimension.isMobile(
            constraints,
            0.1,
            0.05,
          ),
        ),
        child: Column(
          children: [
            Text(
              "Privacy Policy",
              style: GoogleFonts.ptSans(
                color: kTextColourDeepPurple,
                fontSize: VYGDimension.isAll(constraints, 0.03, 0.018, 0.015),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.94,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: VYGDimension.isMobile(constraints, 0.02, 0.010),
              ),
              child: Text(
                "Privacy Policy",
                textAlign: TextAlign.center,
                style: GoogleFonts.ptSans(
                  color: kTextColourIndigo,
                  fontSize: VYGDimension.isMobile(constraints, 0.06, 0.06),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 0.1, 0.05),
            ),
            // PrivacyPolicyCard(
            //   constraints: constraints,
            //   heading: '1. Heading',
            //   body:
            //       '$kFirmName (website url address: $kFirmTagLine) appreciates your business and trust.'
            //       ' We are Cyprus based company, creating products to enhance your website building experience.'
            //       ' Please read this Privacy Policy, providing consent to both documents in order to have'
            //       ' permission to use our services.',
            // ),
            // PrivacyPolicyCard(
            //   constraints: constraints,
            //   heading: '2. Heading',
            //   body:
            //       '$kFirmName (website url address: $kFirmTagLine) appreciates your business and trust.'
            //       ' We are Cyprus based company, creating products to enhance your website building experience.'
            //       ' Please read this Privacy Policy, providing consent to both documents in order to have'
            //       ' permission to use our services.',
            // ),
            // PrivacyPolicyCard(
            //   constraints: constraints,
            //   heading: '3. Heading',
            //   body:
            //       '$kFirmName (website url address: $kFirmTagLine) appreciates your business and trust.'
            //       ' We are Cyprus based company, creating products to enhance your website building experience.'
            //       ' Please read this Privacy Policy, providing consent to both documents in order to have'
            //       ' permission to use our services.',
            // ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('PrivacyPolicy')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CupertinoActivityIndicator(radius: 20),
                    );
                  } else {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Text(
                          snapshot.data!.docs[index].get("PrivacyPolicy"),
                          style: GoogleFonts.ptSans(
                            fontSize: VYGDimension.isAll(
                                constraints, 0.030, 0.018, 0.014),
                            fontWeight: FontWeight.w600,
                            color: kTextColourGrey,
                            letterSpacing: 0.85,
                          ),
                        );
                      },
                    );
                  }
                }),
            SizedBox(
              height: VYGDimension.isMobile(constraints, 0.1, 0.05),
            ),
          ],
        ),
      );
    });
  }
}
