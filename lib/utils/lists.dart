import 'package:vygcars/utils/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<String> carImagePath = [
  'assets/images/car1.jpg',
  'assets/images/car2.jpg',
  'assets/images/car3.jpg',
  'assets/images/car4.jpg',
];

final List<String> iconImagePath = [
  'assets/images/person.png',
  'assets/images/gear.png',
  'assets/images/door.png',
];

final List<Service> serviceList1 = [
  Service(buttonName: "Rental Tips", onTap: () {}),
  Service(buttonName: "News & Updates", onTap: () {}),
  Service(buttonName: "Low Cost Rent", onTap: () {}),
  Service(buttonName: "Car Adventures", onTap: () {}),
  Service(buttonName: "Insurance Cases", onTap: () {}),
  Service(buttonName: "Portfolio", onTap: () {}),
];

final List<Service> serviceList2 = [
  Service(buttonName: "Rental Tips 2", onTap: () {}),
  Service(buttonName: "News & Updates 2", onTap: () {}),
  Service(buttonName: "Low Cost Rent 2", onTap: () {}),
  Service(buttonName: "Car Adventures 2", onTap: () {}),
  Service(buttonName: "Insurance Cases 2", onTap: () {}),
];

final List<CarModel> carModelItemList = [
  CarModel(
    carModelImagePath: 'assets/images/carmodel1.png',
    carName: "Car 1",
    carType: "Compact",
    carRentPrice: "\$12",
    doorCount: 4,
    noOfPassengers: 2,
    transmissionType: "M",
  ),
  CarModel(
    carModelImagePath: 'assets/images/carmodel2.png',
    carName: "Car 2",
    carType: "Compact ok",
    carRentPrice: "\$12",
    doorCount: 4,
    noOfPassengers: 4,
    transmissionType: "A",
  ),
  CarModel(
    carModelImagePath: 'assets/images/carmodel3.png',
    carName: "Car 3",
    carType: "Compact ok2",
    carRentPrice: "\$12",
    doorCount: 2,
    noOfPassengers: 4,
    transmissionType: "A",
  ),
  CarModel(
    carModelImagePath: 'assets/images/carmodel4.png',
    carName: "Car 3",
    carType: "Compact ok2",
    carRentPrice: "\$12",
    doorCount: 22,
    noOfPassengers: 4,
    transmissionType: "A",
  ),
  CarModel(
    carModelImagePath: 'assets/images/carmodel5.png',
    carName: "Car 3",
    carType: "Compact ok2",
    carRentPrice: "\$12",
    doorCount: 22,
    noOfPassengers: 4,
    transmissionType: "A",
  ),
  CarModel(
    carModelImagePath: 'assets/images/carmodel6.png',
    carName: "Car 3",
    carType: "Compact ok2",
    carRentPrice: "\$12",
    doorCount: 22,
    noOfPassengers: 4,
    transmissionType: "A",
  ),
  CarModel(
    carModelImagePath: 'assets/images/carmodel7.png',
    carName: "Car 3",
    carType: "Compact ok2",
    carRentPrice: "\$12",
    doorCount: 22,
    noOfPassengers: 4,
    transmissionType: "A",
  ),
  CarModel(
    carModelImagePath: 'assets/images/carmodel8.png',
    carName: "Car 3",
    carType: "Compact ok2",
    carRentPrice: "\$12",
    doorCount: 22,
    noOfPassengers: 4,
    transmissionType: "A",
  ),
];

final List<ClientReview> clientReviewList = [
  ClientReview(
    clientImagePath: 'assets/images/client1.jpg',
    clientReview:
        '“Very happy with the car, the service, the booster seat for my child and the friendly faces at the airport depot. '
        'I will use your friendly service again and recommend it to others. '
        'Thank you so much!”',
    clientName: 'Client 1',
    clientAge: 24,
  ),
  ClientReview(
    clientImagePath: 'assets/images/client2.jpg',
    clientReview:
        '“Very happy with the car, the service, the booster seat for my child and the friendly faces at the airport depot. '
        'I will use your friendly service again and recommend it to others. '
        'Thank you so much!”',
    clientName: 'Client 2',
    clientAge: 31,
  ),
  ClientReview(
    clientImagePath: 'assets/images/client3.jpg',
    clientReview:
        'Very efficient pick up & delivery back. Great staff and a very impressive vehicle (Mitsubishi Outlander). '
        'Great service when staff discovered glasses left behind in the car and recalled shuttle to pick them up. Thanks.',
    clientName: 'Client 3',
    clientAge: 26,
  ),
];

final List<MyButton> headerSectionsButtonList = [
  MyButton(
    buttonName: 'Home',
    onButtonTap: () {
      print("Home Tapped");
    },
  ),
  // MyButton(
  //     buttonName: 'Features',
  //     onButtonTap: () {
  //       print("Features Tapped");
  //     }),
  MyButton(
      buttonName: 'About Us',
      onButtonTap: () {
        print("About Us Tapped");
      }),
  MyButton(
      buttonName: 'News',
      onButtonTap: () {
        print("News Tapped");
      }),
  MyButton(
      buttonName: 'Contact Us',
      onButtonTap: () {
        print("Contact Us Tapped");
      }),
  MyButton(
      buttonName: 'FAQ',
      onButtonTap: () {
        print("FAQ Tapped");
      }),
  MyButton(
      buttonName: 'Privacy Policy',
      onButtonTap: () {
        print("Privacy Policy Tapped");
      }),
];

final List<MySocialButton> headerSocialsButtonList = [
  MySocialButton(
      buttonIcon: FontAwesomeIcons.facebook,
      //add colour white
      onButtonTap: () {
        print("FB Tapped");
      }),
  MySocialButton(
      buttonIcon: FontAwesomeIcons.linkedin,
      onButtonTap: () {
        print("LI Tapped");
      }),
  MySocialButton(
      buttonIcon: FontAwesomeIcons.twitter,
      onButtonTap: () {
        print("TW Tapped");
      }),
];

final List<CircleImageModel> circleImageContentsList = [
  CircleImageModel(
    buttonNumber: 1,
    buttonIcon: FontAwesomeIcons.map,
    buttonLabel: "Date & Location",
    buttonDescription: "Pick the location and the needed rent date.",
  ),
  CircleImageModel(
    buttonNumber: 2,
    buttonIcon: FontAwesomeIcons.car,
    buttonLabel: "Date & Location",
    buttonDescription: "Pick the location and the needed rent date.",
  ),
  CircleImageModel(
    buttonNumber: 3,
    buttonIcon: FontAwesomeIcons.bus,
    buttonLabel: "Date & Location",
    buttonDescription: "Pick the location and the needed rent date.",
  ),
  CircleImageModel(
    buttonNumber: 4,
    buttonIcon: FontAwesomeIcons.ticket,
    buttonLabel: "Date & Location",
    buttonDescription: "Pick the location and the needed rent date.",
  ),
];