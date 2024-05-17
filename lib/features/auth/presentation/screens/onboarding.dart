// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key, required String title}); //observe this

  @override
  State<StatefulWidget> createState() {
    return _Onboarding();
  }
}

class _Onboarding extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF3B3B3B),
      bodyPadding: const EdgeInsets.fromLTRB(-15.00, 10.00, -15.00, -50.00),
      safeAreaList: const [false, false, false, false],
      globalFooter: const SizedBox(
        height: 20,
      ),
      //main background of screen
      pages: [
        //set your page view here
        PageViewModel(
          title: "",
          bodyWidget: introImage1(),
          useScrollView: false,
        ),
        PageViewModel(
          title: "",
          bodyWidget: introImage2(),
          useScrollView: false,
        ),
        PageViewModel(
          title: "",
          bodyWidget: introImage3(),
          useScrollView: false,
        ),
      ],

      onDone: () => takeMeToLoginScreen(context),
      //onSkip: () => takeMeToLoginScreen(context),
      showSkipButton: false,
      showNextButton: false,
      dotsFlex: 2, //skipFLex initially
      nextFlex: 8,

      done: Container(
        width: 186,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
        decoration: ShapeDecoration(
          color: const Color(0xFFBE0027),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Color(0xff939393), //color of dots
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xffffffff), //color of active dot
        spacing: EdgeInsets.only(left: 5.0),
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void takeMeToLoginScreen(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }), (Route<dynamic> route) => false);
  }

  Widget introImage1() {
    return Expanded(
      child: Container(
        width: 390,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF3A3A3A)),
        child: Stack(
          children: [
            Positioned(
              left: 48,
              top: 240,
              child: Container(
                width: 295,
                height: 591,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('asset/images/onboarding-intro-2.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 158,
              top: 25,
              child: Opacity(
                opacity: 0.20,
                child: Container(
                  width: 241,
                  height: 110,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3A3A3A),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 50,
              top: 55,
              child: SizedBox(
                width: 273,
                child: Text(
                  'Couldn’t attend your class in person? You can take them online',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 165,
              top: 255,
              child: Container(
                width: 72,
                height: 25,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget introImage2() {
    return Expanded(
      child: Container(
        width: 390,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF3A3A3A)),
        child: Stack(
          children: [
            Positioned(
              left: 48,
              top: 240,
              child: SizedBox(
                width: 295,
                height: 591,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage('asset/images/onboarding-intro-2.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 160,
              top: 15,
              child: SizedBox(
                width: 389,
                height: 122,
                child: Opacity(
                  opacity: 0.20,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3A3A3A),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFF4F4F4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 712,
              child: SizedBox(
                width: 375,
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFF3A3A3A)),
                ),
              ),
            ),
            const Positioned(
                left: 53,
                top: 40,
                child: SizedBox(
                  width: 280,
                  height: 95,
                  child: Text(
                    'All your class schedule in one place, don’t miss a single class or event!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                )),
            Positioned(
              left: 160,
              top: 260,
              child: SizedBox(
                width: 72,
                height: 24,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget introImage3() {
    return Expanded(
      child: Container(
        width: 390,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF3A3A3A)),
        child: Stack(
          children: [
            Positioned(
              left: 48,
              top: 240,
              child: SizedBox(
                width: 295,
                height: 591,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage('asset/images/onboarding-intro-3.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 154,
              top: 30,
              child: SizedBox(
                width: 389,
                height: 122,
                child: Opacity(
                  opacity: 0.20,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3A3A3A),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFF4F4F4)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 712,
              child: SizedBox(
                width: 375,
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFF3A3A3A)),
                ),
              ),
            ),
            const Positioned(
              left: 32,
              top: 55,
              child: SizedBox(
                width: 282,
                height: 95,
                child: Text(
                  'Keep track of all your tuitions, and make payments with ease and timely.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 160,
              top: 255,
              child: SizedBox(
                width: 72,
                height: 24,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
