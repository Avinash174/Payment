import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:payment/upi.dart';

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
      home: const GooglepayScreen(),
    );
  }
}

class GooglepayScreen extends StatefulWidget {
  const GooglepayScreen({super.key});

  @override
  State<GooglepayScreen> createState() => _GooglepayScreenState();
}

class _GooglepayScreenState extends State<GooglepayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => UpiTransaction()));
            },
            child: const Text('UPI Tansaction'),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                var openAppResult = await LaunchApp.openApp(
                  androidPackageName: 'net.pulsesecure.pulsesecure',
                );
              },
              child: const Text('Gpay Transaction'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MyApp(),
            ),
          );
        },
        child: const Icon(
          Icons.payment,
        ),
      ),
    );
  }
}
