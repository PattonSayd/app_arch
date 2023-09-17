import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    required this.initTime,
    required this.child,
  }) : super(key: key);

  final Future<void> Function() initTime;
  final Widget child;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool initizlized = false;

  @override
  void initState() {
    super.initState();
    widget.initTime().then((value) => setState(() => initizlized = true));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: initizlized
            ? widget.child
            : Center(
                child: Image.asset(
                  "assets/splash.gif",
                ),
              ),
      );
}
