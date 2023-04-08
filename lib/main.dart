import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vygcars/utils/responsive.dart';
import 'package:vygcars/screens/mobile_ui/mobile_home.dart';
import 'package:vygcars/screens/tablet_ui/tablet_home.dart';
import 'package:vygcars/screens/desktop_ui/desktop_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCmybmER7aEzqIBSGIyOomesZ9GEaFSuD4",
        appId: "1:455304960127:web:f0bb1bb2420e955ad9874a",
        projectId: "vgycars",
        storageBucket: "vgycars.appspot.com",
        messagingSenderId: "455304960127",
        measurementId: "G-R7HMWQE25F"),
  );
  runApp(
    const VYGCars(),
  );
}

class VYGCars extends StatelessWidget {
  const VYGCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WebHome(),
      home: ResponsiveLayout(
        mobileScaffold: MobileHome(),
        tabletScaffold: TabletHome(),
        desktopScaffold: DesktopHome(),
      ),
    );
  }
}
