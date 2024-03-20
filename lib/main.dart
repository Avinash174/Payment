import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GpayScreen(),
    );
  }
}

class GpayScreen extends StatefulWidget {
  const GpayScreen({super.key});

  @override
  State<GpayScreen> createState() => _GpayScreenState();
}

class _GpayScreenState extends State<GpayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                var openAppResult = await LaunchApp.openApp(
                  androidPackageName: 'com.google.android.apps.walletnfcrel',
                );
              },
              child: Text('Gpay'),
            ),
          )
        ],
      ),
    );
  }
}

// void _launchGooglePay() async {
//   // The deep link for Google Pay
//   const url = 'https://pay.google.com';

//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
