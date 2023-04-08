import 'package:flutter/material.dart';

//1. Class used to create button objects that store button names & their functions.
class MyButton {
  final String buttonName;
  final Function() onButtonTap;

  MyButton({required this.buttonName, required this.onButtonTap});
}

//2. Class used to create Social button objects that store button names & their functions.
class MySocialButton {
  final IconData buttonIcon;
  final Function() onButtonTap;

  MySocialButton({required this.buttonIcon, required this.onButtonTap});
}

//3. Class used to create Circle Image Content objects to store inside a list.
class CircleImageModel {
  final int buttonNumber;
  final IconData buttonIcon;
  final String buttonLabel;
  final String buttonDescription;

  CircleImageModel(
      {required this.buttonNumber,
        required this.buttonIcon,
        required this.buttonLabel,
        required this.buttonDescription});
}

//4. Class used to create car model objects to store inside a list.
class CarModel {
  final String carModelImagePath;
  final String carName;
  final String carType;
  final String carRentPrice;
  final int noOfPassengers;
  final String transmissionType;
  final int doorCount;

  CarModel({
    required this.carModelImagePath,
    required this.carName,
    required this.carType,
    required this.carRentPrice,
    required this.noOfPassengers,
    required this.transmissionType,
    required this.doorCount,
  });
}

//5. Class used to create client review objects to store inside a list.
class ClientReview {
  final String clientImagePath;
  final String clientReview;
  final String clientName;
  final int clientAge;

  ClientReview({
    required this.clientImagePath,
    required this.clientReview,
    required this.clientName,
    required this.clientAge,
  });
}

//6. Class used to create Services List objects to store inside a list.
class Service {
  String buttonName;
  Function() onTap;

  Service({required this.buttonName, required this.onTap});
}