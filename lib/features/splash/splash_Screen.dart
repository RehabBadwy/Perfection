import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:perfection/core/theming/styles.dart';
import 'package:perfection/features/users/ui/users_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: AnimatedSplashScreen(
          splash:  Center(
            child: Text("Perfection",
            textAlign: TextAlign.center,
            style: TextStyles.font24Bold.copyWith(
              color: Colors.white,
            )
            ),
          ),
          nextScreen:  const UsersScreen(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
          backgroundColor: Colors.purple,
          splashIconSize: 200,
         // nextRoute: Routes.onboarding,
        )
    );
  }
}
