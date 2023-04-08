import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vygcars/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:vygcars/utils/widgets.dart';

//1. Class used to calculate dimensions depending on the available screen width.
class VYGDimension {
  static double isMobile(constraints, value1, value2) {
    return constraints.maxWidth < 650
        ? constraints.maxWidth * value1
        : constraints.maxWidth * value2;
  }

  static double isTablet(constraints, value1, value2) {
    return constraints.maxWidth < 1100
        ? constraints.maxWidth * value1
        : constraints.maxWidth * value2;
  }

  static double isAll(constraints, value1, value2, value3) {
    return constraints.maxWidth < 650
        ? constraints.maxWidth * value1
        : constraints.maxWidth < 1100
        ? constraints.maxWidth * value2
        : constraints.maxWidth * value3;
  }
}

//2. Class used to perform some general functions of VYG Website.
class VYGFunctions {

  static buildSocialButton(constraints, buttonIcon, onButtonTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Button(
        buttonHeight: VYGDimension.isMobile(constraints, 0.1, 0.04),
        buttonWidth: VYGDimension.isMobile(constraints, 0.1, 0.04),
        buttonColour: kSecondaryColour,
        buttonChild: Center(
          child: Icon(
            buttonIcon,
            size: VYGDimension.isMobile(constraints, 0.05, 0.018),
            color: kMainBackGroundColour,
          ),
        ),
        onButtonTap: onButtonTap,
      ),
    );
  }

  static buildSectionButton(constraints, buttonName, onButtonTap) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Button(
        buttonHeight: VYGDimension.isMobile(constraints, 0.1, 0.056),
        buttonWidth: VYGDimension.isMobile(constraints, 0.6, 0.09),
        buttonColour: kSecondaryColour,
        buttonChild: Center(
          child: Text(
            buttonName,
            style: GoogleFonts.ptSans(
              fontSize: VYGDimension.isMobile(constraints, 0.04, 0.013),
              fontWeight: FontWeight.w800,
              color: kMainBackGroundColour,
            ),
          ),
        ),
        onButtonTap: onButtonTap,
      ),
    );
  }

  static launchLink(url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could Not Launch URL';
    }
  }
}