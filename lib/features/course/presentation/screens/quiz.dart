import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/course.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/start_quiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void gotoStartQuiz(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const StartQuiz();
      }),
      (Route<dynamic> route) => false,
    );
  }

  void goBack(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const Course();
      }),
      (Route<dynamic> route) => false,
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
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
    final ThemeData theme = Theme.of(context);

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
                              'Choose True or False as your answer for SECTION 1 Choose the correct answer for SECTION 2 multiple choice questions. Choose True or False as your answer for SECTION 1 Choose the correct answer for SECTION 2 multiple choice questions.',
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
                        const SizedBox(height: 100.0),
                        const Center(
                          child: SizedBox(
                            width: 241.00,
                            child: Text(
                              '35 Questions Quiz',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Center(
                          child: SizedBox(
                            width: 241,
                            child: Text(
                              'You can start and pause at any time wish until 12, Jun 2024',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFBEBEBE),
                                fontSize: 16,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 280.0),
                        Center(
                          child: SizedBox(
                            width: 327.0,
                            height: 48.0,
                            child: MaterialButton(
                              color: const Color(0xFFBE0027),
                              onPressed: () => gotoStartQuiz(context),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text(
                                'Start Quiz',
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
