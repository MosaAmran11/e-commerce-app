import 'package:device_preview/device_preview.dart';
// import 'package:e_commerce_app/pages/bottomnav.dart';
import 'package:e_commerce_app/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(), // Wrap your app
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xfffd6f3e),
            primary: const Color(0xfffd6f3e)),
        useMaterial3: true,
      ),
      home: const SignUp(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      darkTheme: ThemeData.dark(),
    );
  }
}
