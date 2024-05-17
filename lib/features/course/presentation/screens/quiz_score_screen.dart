import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';

class QuizScoreScreen extends StatefulWidget {
  const QuizScoreScreen({super.key});

  @override
  State<QuizScoreScreen> createState() => _QuizScoreScreenState();
}

class _QuizScoreScreenState extends State<QuizScoreScreen> {
  void gotoDashboard(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const Dashboard();
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
        onPressed: () => gotoDashboard(context),
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
                              'Congratulations! You have successfully completed your exam for this course, your score is shown below, you can return to your Dashboard.',
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
                              'Your result is \nReady and you Scored:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w500,
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
                              '83.3/100',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
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
                              onPressed: () => gotoDashboard(context),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text(
                                'Thank you!',
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
