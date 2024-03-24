import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Open Chrome App Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              launchChrome();
            },
            child: Text('Open Chrome App'),
          ),
        ),
      ),
    );
  }

  // Function to launch Chrome
  void launchChrome() async {
    const url = 'googlechrome://';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
