import 'package:app_arch/app/ui/splash_screen.dart';
import 'package:app_arch/home/ui/home_screen.dart';
import 'package:app_arch/home/ui/home_splash_screen.dart';
import 'package:app_arch/login/ui/login_screen.dart';
import 'package:app_arch/shared/const/strings.dart';
import 'package:app_arch/shared/scope/app/app_scope/app_scope.dart';
import 'package:app_arch/shared/scope/auth/auth.dart';
import 'package:app_arch/shared/scope/user/user_scope.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: AppScope(
        init: () => Future.delayed(const Duration(milliseconds: 5500)),
        initialization: (_) => const SplashScreen(),
        initialized: (_) => Auth(
          notAuthorized: (_) => const LoginScreen(),
          authorized: (_, user) => UserScope(
            user: user,
            init: (user) =>
                Future<void>.delayed(const Duration(milliseconds: 3000)),
            initialization: (context) => const HomeSplashScreen(),
            initialized: (context) => HomeScreen(user: user),
          ),
        ),
      ),
    );
  }
}
