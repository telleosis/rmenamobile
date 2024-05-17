import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/login.dart';

class PasswordResetConfirmed extends StatefulWidget {
  const PasswordResetConfirmed({super.key});

  @override
  State<PasswordResetConfirmed> createState() => _PasswordResetConfirmed();
}

class _PasswordResetConfirmed extends State<PasswordResetConfirmed> {
  @override
  Widget build(BuildContext context) {
    void takeMeToLoginScreen(context) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }), (Route<dynamic> route) => false);
    }

    void callResendLinkAPI(BuildContext context) {}

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
        shadowColor: const Color(0xffffffff),
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: const Color(0xFF3A3A3A),
        toolbarHeight: 116.0,
        title: const SizedBox(
          width: 130,
          height: 27,
          child: Text(
            'Password Reset',
            textAlign: TextAlign.center,
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: 375,
                    height: 844,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 15.50,
                          top: 80,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Please check your email',
                                style: TextStyle(
                                  color: Color(0xFF212B36),
                                  fontSize: 24,
                                  fontFamily: 'Helvetica Neue',
                                  fontWeight: FontWeight.w700,
                                  height: 1.3,
                                ),
                              ),
                              SizedBox(height: 4),
                              SizedBox(
                                width: 344,
                                child: Text(
                                  'We have sent an email to bright@gmail.com, To reset your password, click on the link contained in that email.',
                                  style: TextStyle(
                                    color: Color(0xFF637381),
                                    fontSize: 14,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 250,
                          child: ElevatedButton(
                            onPressed: () {
                              onPressed:
                              () => takeMeToLoginScreen(context);
                            },
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 11),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFBE0027),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Continue to Login',
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
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 250,
                          child: ElevatedButton(
                              onPressed: () {
                                onPressed:
                                () => callResendLinkAPI(context);
                              },
                              child: const Text(
                                'Resend link',
                                style: TextStyle(
                                  color: Color(0xFF212B36),
                                  fontSize: 15,
                                  fontFamily: 'Helvetica Neue',
                                  fontWeight: FontWeight.w700,
                                  height: 1.3,
                                ),
                              )),
                        ),
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
