import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Image.asset(
            "assets/sp.gif",
          ),
        ),
      );
}
