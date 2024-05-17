import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/onboarding.dart'; // Import your routes file

class Splash extends StatefulWidget {
  const Splash({super.key, required this.title});

  final String title;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void navigateTo(Widget screen) {
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Delayed navigation to the next screen after 2 seconds
    Future.delayed(const Duration(seconds: 3), () {
      navigateTo(const Onboarding(title: 'Onboarding Screen'));
    });

    return Container(
      color: const Color(0xFF3A3A3A), // Use your desired background color
      child: Stack(
        children: [
          // Positioned(
          //   left: 90,
          //   top: 750,
          //   child: SizedBox(
          //     width: 160,
          //     height: 49,
          //     child: Image.asset(
          //       'asset/images/mena_logo.png',
          //       colorBlendMode: BlendMode.softLight,
          //     ),
          //   ),
          // ),
          Positioned(
            left: 160,
            top: 248,
            child: Container(
              width: 625,
              height: 217,
              decoration: ShapeDecoration(
                color: const Color(0xFF720017),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 625,
                height: 392,
                decoration: const ShapeDecoration(
                  color: Color(0xFF585858),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(16)),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 160,
            top: 249,
            child: Container(
              width: 465,
              height: 144,
              decoration: const ShapeDecoration(
                color: Color(0xFFBE0027),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
