import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/quiz.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  void goBack(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const QuizScreen();
      }),
      (Route<dynamic> route) => false,
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back_outlined),
      //   onPressed: () => Navigator.pop(context),
      // ),
      leading: IconButton(
        icon: const Icon(CupertinoIcons.clear_thick),
        iconSize: 24,
        color: const Color(0xFFFFFFFF),
        onPressed: () => goBack(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3A3A3A),
      appBar: _appBar(context),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: 329,
                          child: Text(
                            'PNUEMATOLOGY 1 - EXAM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: 329,
                            child: Text(
                              'Choose True or False as your answer for SECTION 1 Choose the correct answer for SECTION 2 multiple choice questions.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Center(
                          child: Container(
                            width: 340,
                            height: 431,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Center(
                          child: SizedBox(
                            width: 327.0,
                            height: 48.0,
                            child: MaterialButton(
                              color: const Color(0xFFBE0027),
                              onPressed: () {
                                //TODO
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Helvetica Neue',
                                  fontWeight: FontWeight.w700,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
