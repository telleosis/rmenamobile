import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/login.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    super.dispose();
  }

  void callPasswordResetAPI(BuildContext context) {}

  PreferredSizeWidget get _appBar {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          gotoLoginScreen(context);
        },
        icon: const Icon(CupertinoIcons.back),
        color: const Color(0xffffffff),
      ),
      title: const Text(
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
      toolbarHeight: 116.0,
    );
  }

  void gotoLoginScreen(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: _appBar,
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reset your password',
                style: TextStyle(
                  color: Color(0xFF212B36),
                  fontSize: 24,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 344,
                child: Text(
                  'We will send you a password reset instruction',
                  style: TextStyle(
                    color: Color(0xFF637381),
                    fontSize: 14,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 340,
                height: 50,
                child: TextFormField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter email address',
                    labelStyle: const TextStyle(
                      color: Color(0xFF919EAB),
                      fontSize: 14,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x51919EAB),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x51919EAB),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  onPressed:
                  () => callPasswordResetAPI(context);
                },
                child: Container(
                  width: 290,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
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
                        'Submit',
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
            ],
          ),
        ),
      ),
    );
  }
}
