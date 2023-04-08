import 'package:flutter/material.dart';
import 'package:vygcars/utils/lists.dart';
import 'package:vygcars/utils/constants.dart';
import 'package:vygcars/utils/functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:vygcars/screens/desktop_ui/desktop_home.dart';
import 'package:vygcars/screens/desktop_ui/desktop_about_us.dart';
import 'package:vygcars/screens/desktop_ui/desktop_faq.dart';
import 'package:vygcars/screens/desktop_ui/desktop_contact_us.dart';
import 'package:vygcars/screens/desktop_ui/desktop_privacy_policy.dart';
import 'package:vygcars/screens/mobile_ui/mobile_home.dart';
import 'package:vygcars/screens/mobile_ui/mobile_about_us.dart';
import 'package:vygcars/screens/mobile_ui/mobile_faq.dart';
import 'package:vygcars/screens/mobile_ui/mobile_contact_us.dart';
import 'package:vygcars/screens/mobile_ui/mobile_privacy_policy.dart';
import 'package:vygcars/screens/tablet_ui/tablet_home.dart';
import 'package:vygcars/screens/tablet_ui/tablet_about_us.dart';
import 'package:vygcars/screens/tablet_ui/tablet_faq.dart';
import 'package:vygcars/screens/tablet_ui/tablet_contact_us.dart';
import 'package:vygcars/screens/tablet_ui/tablet_privacy_policy.dart';

//1. Basic Button.
class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonColour,
    required this.buttonChild,
    required this.onButtonTap,
  });

  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColour;
  final Widget buttonChild;
  final Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: buttonColour,
        ),
        child: Center(child: buttonChild),
      ),
    );
  }
}

//2. FirmLogo.
class FirmLogo extends StatelessWidget {
  const FirmLogo({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: VYGDimension.isMobile(constraints, 0.2, 0.1),
        ),
      ],
    );
  }
}

//3. Header Contents for Mobile View.
class HeaderContentsMobileView extends StatelessWidget {
  const HeaderContentsMobileView({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Button(
        buttonHeight: constraints.maxWidth * 0.08,
        buttonWidth: constraints.maxWidth * 0.16,
        buttonColour: kMainBackGroundColour,
        buttonChild: Icon(
          FontAwesomeIcons.list,
          color: kSecondaryColour,
          size: constraints.maxWidth * 0.055,
        ),
        onButtonTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: kWhiteVyg,
                content: Container(
                  height: constraints.maxWidth,
                  width: constraints.maxWidth,
                  color: kWhiteVyg,
                  child: Column(
                    children: [
                      VYGFunctions.buildSectionButton(constraints, "Home", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => constraints.maxWidth < 650
                                ? const MobileHome()
                                : constraints.maxWidth < 1100
                                    ? const TabletHome()
                                    : const DesktopHome(),
                          ),
                        );
                      }),
                      VYGFunctions.buildSectionButton(constraints, "About Us",
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => constraints.maxWidth < 650
                                ? const MobileAboutUs()
                                : constraints.maxWidth < 1100
                                    ? const TabletAboutUs()
                                    : const DesktopAboutUs(),
                          ),
                        );
                      }),
                      VYGFunctions.buildSectionButton(constraints, "FAQ", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => constraints.maxWidth < 650
                                ? const MobileFaq()
                                : constraints.maxWidth < 1100
                                    ? const TabletFaq()
                                    : const DesktopFaq(),
                          ),
                        );
                      }),
                      VYGFunctions.buildSectionButton(constraints, "Contact US",
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => constraints.maxWidth < 650
                                ? const MobileContactUs()
                                : constraints.maxWidth < 1100
                                    ? const TabletContactUs()
                                    : const DesktopContactUs(),
                          ),
                        );
                      }),
                      VYGFunctions.buildSectionButton(
                          constraints, "Privacy Policy", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => constraints.maxWidth < 650
                                ? const MobilePrivacyPolicy()
                                : constraints.maxWidth < 1100
                                    ? const TabletPrivacyPolicy()
                                    : const DesktopPrivacyPolicy(),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VYGFunctions.buildSocialButton(
                            constraints,
                            FontAwesomeIcons.facebook,
                            () {
                              VYGFunctions.launchLink(
                                  'https://www.facebook.com/VYGcar');
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          VYGFunctions.buildSocialButton(
                            constraints,
                            FontAwesomeIcons.linkedin,
                            () {
                              VYGFunctions.launchLink(
                                  'https://www.linkedin.com/company/vygtech/');
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          VYGFunctions.buildSocialButton(
                            constraints,
                            FontAwesomeIcons.instagram,
                            () {
                              VYGFunctions.launchLink(
                                  'https://instagram.com/vygcar');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

//4. Header Contents for Web View.
class HeaderContentsWebView extends StatelessWidget {
  const HeaderContentsWebView({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: constraints.maxWidth * 0.04,
          width: constraints.maxWidth * 0.6,
          //color: Colors.red,
          child: Row(
            children: [
              VYGFunctions.buildSectionButton(constraints, "Home", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => constraints.maxWidth < 650
                        ? const MobileHome()
                        : constraints.maxWidth < 1100
                            ? const TabletHome()
                            : const DesktopHome(),
                  ),
                );
              }),
              VYGFunctions.buildSectionButton(constraints, "About Us", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => constraints.maxWidth < 650
                        ? const MobileAboutUs()
                        : constraints.maxWidth < 1100
                            ? const TabletAboutUs()
                            : const DesktopAboutUs(),
                  ),
                );
              }),
              VYGFunctions.buildSectionButton(constraints, "FAQ", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => constraints.maxWidth < 650
                        ? const MobileFaq()
                        : constraints.maxWidth < 1100
                            ? const TabletFaq()
                            : const DesktopFaq(),
                  ),
                );
              }),
              VYGFunctions.buildSectionButton(constraints, "Contact US", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => constraints.maxWidth < 650
                        ? const MobileContactUs()
                        : constraints.maxWidth < 1100
                            ? const TabletContactUs()
                            : const DesktopContactUs(),
                  ),
                );
              }),
              VYGFunctions.buildSectionButton(constraints, "Privacy Policy",
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => constraints.maxWidth < 650
                        ? const MobilePrivacyPolicy()
                        : constraints.maxWidth < 1100
                            ? const TabletPrivacyPolicy()
                            : const DesktopPrivacyPolicy(),
                  ),
                );
              }),
            ],
          ),
        ),
        SizedBox(
          width: constraints.maxWidth * 0.01,
        ),
        Container(
          height: constraints.maxWidth * 0.04,
          width: constraints.maxWidth * 0.16,
          //color: Colors.redAccent,
          child: Row(
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
        ),
      ],
    );
  }
}

//5. Basic TextButton
class VYGTextButton extends StatelessWidget {
  const VYGTextButton({
    super.key,
    required this.constraints,
    required this.buttonName,
    required this.onTap,
  });

  final BoxConstraints constraints;
  final String buttonName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        buttonName,
        style: GoogleFonts.ptSans(
          fontSize: VYGDimension.isAll(constraints, 0.030, 0.018, 0.014),
          fontWeight: FontWeight.w600,
          color: kTextColourGrey,
        ),
      ),
    );
  }
}

//6. Circular Info chip used to show car details (Passengers, Transmission type, Doors)
class CarInfoChip extends StatelessWidget {
  const CarInfoChip({
    super.key,
    required this.constraints,
    required this.pathNumber,
    required this.chipInfoDetailNumber,
  });

  final BoxConstraints constraints;
  final int pathNumber;
  final String chipInfoDetailNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: constraints.maxWidth < 650
          ? const Alignment(1.1, 1.2)
          : constraints.maxWidth < 1100
              ? const Alignment(1, 1.4)
              : const Alignment(1.1, 1.5),
      children: [
        Container(
          height: VYGDimension.isAll(constraints, 0.12, 0.04, 0.04),
          width: VYGDimension.isAll(constraints, 0.12, 0.04, 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              VYGDimension.isAll(constraints, 0.16, 0.04, 0.04),
            ),
            border: Border.all(
              width: 1.2,
              color: kSecondaryColour,
            ),
          ),
          child: Center(
            child: SizedBox(
              height: VYGDimension.isAll(constraints, 0.065, 0.02, 0.02),
              width: VYGDimension.isAll(constraints, 0.065, 0.02, 0.02),
              child: Image(
                image: AssetImage(
                  iconImagePath[pathNumber],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: VYGDimension.isAll(constraints, 0.04, 0.016, 0.016),
          width: VYGDimension.isAll(constraints, 0.04, 0.016, 0.016),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              VYGDimension.isAll(constraints, 0.015, 0.006, 0.006),
            ),
          ),
          child: Center(
            child: Text(
              chipInfoDetailNumber,
              style: GoogleFonts.ptSans(
                  fontSize: VYGDimension.isAll(constraints, 0.03, 0.012, 0.012),
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

//7. Card used to display FAQ Question and Answers.
class FAQCard extends StatelessWidget {
  const FAQCard(
      {super.key,
      required this.constraints,
      required this.question,
      required this.answer});

  final BoxConstraints constraints;
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: VYGDimension.isMobile(constraints, 0.9, 0.8),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            VYGDimension.isMobile(constraints, 0.02, 0.02),
          ),
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.all(15),
            iconColor: kSecondaryColour,
            title: Center(
              child: Text(
                question,
                style: GoogleFonts.albertSans(
                  color: kSecondaryColour,
                  fontSize: VYGDimension.isMobile(constraints, 0.04, 0.02),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            children: [
              Text(
                answer,
                style: GoogleFonts.albertSans(
                  color: Colors.grey,
                  fontSize: VYGDimension.isMobile(constraints, 0.03, 0.018),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//8. Column used to display Contact Us Information.
class ContactDetailsColumn extends StatelessWidget {
  const ContactDetailsColumn({
    Key? key,
    required this.constraints,
    required this.headingText,
    required this.details,
    required this.icon,
    required this.onIconTap,
  }) : super(key: key);

  final BoxConstraints constraints;
  final String headingText;
  final String details;
  final IconData icon;
  final Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onIconTap,
          child: Container(
            height: VYGDimension.isMobile(constraints, 0.08, 0.1),
            width: VYGDimension.isMobile(constraints, 0.08, 0.1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                VYGDimension.isMobile(constraints, 0.08, 0.1),
              ),
              color: kWhiteVyg,
            ),
            child: Center(
              child: Icon(
                icon,
                size: 30,
                color: kSecondaryColour,
              ),
            ),
          ),
        ),
        SizedBox(
          height: VYGDimension.isMobile(constraints, 0.05, 0.03),
        ),
        Text(
          headingText,
          textAlign: TextAlign.center,
          style: GoogleFonts.ptSans(
            fontSize: VYGDimension.isAll(constraints, 0.030, 0.018, 0.018),
            fontWeight: FontWeight.w600,
            color: kSecondaryColour,
          ),
        ),
        Text(
          details,
          style: GoogleFonts.ptSans(
            fontSize: VYGDimension.isAll(constraints, 0.018, 0.012, 0.01),
            fontWeight: FontWeight.w600,
            color: kSecondaryColour,
          ),
        ),
      ],
    );
  }
}

// //8. Card used to display Privacy Policy snippets.
// class PrivacyPolicyCard extends StatelessWidget {
//   const PrivacyPolicyCard(
//       {super.key,
//       required this.constraints,
//       required this.heading,
//       required this.body});
//
//   final BoxConstraints constraints;
//   final String heading;
//   final String body;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: Colors.pink,
//       width: constraints.maxWidth * 0.9,
//       padding: const EdgeInsets.all(8),
//       margin: const EdgeInsets.all(4),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 heading,
//                 style: GoogleFonts.albertSans(
//                   color: kSecondaryColour,
//                   fontSize: VYGDimension.isMobile(constraints, 0.03, 0.022),
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//               const SizedBox(
//                 height: 14,
//               ),
//               SizedBox(
//                 //color: Colors.yellowAccent,
//                 width: VYGDimension.isMobile(constraints, 0.75, 0.85),
//                 child: Text(
//                   body,
//                   style: GoogleFonts.albertSans(
//                     color: kSecondaryColour,
//                     fontSize: VYGDimension.isMobile(constraints, 0.03, 0.015),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
