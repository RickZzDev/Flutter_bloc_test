import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fs_checklist/presentation/pages/drivers_page.dart';
import 'package:fs_checklist/presentation/pages/weather_page.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => DriversPage(),
                  ),
                  (route) => false,
                );
              },
              child: Text("MOTORISTAS"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => WeatherPage(),
                  ),
                  (route) => false,
                );
              },
              child: Text("TEMPO"),
            )
          ],
        ),
      ),
      body: body,
    );
  }
}
