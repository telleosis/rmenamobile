import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhema_mena_student_app/features/auth/domain/entities/auth_entity.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rhema_mena_student_app/common/bloc/generic_bloc_state.dart';
import 'package:rhema_mena_student_app/common/dialog/progress_dialog.dart';
import 'package:rhema_mena_student_app/common/dialog/retry_dialog.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/password_reset.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String emailController = "";
  String passwordController = "";

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void takeMeToPasswordResetScreen(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const PasswordReset();
    }), (Route<dynamic> route) => false);
  }

  void takeMeToDashboardScreen(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const Dashboard();
    }), (Route<dynamic> route) => false);
  }

  Future<void> saveUserData(String email, String name, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
    await prefs.setString('userName', name);
    await prefs.setString('authToken', token);
  }

  @override
  Widget build(BuildContext context) {
    //Return Scaffold
    return BlocProvider(
      create: (context) => PasswordToggleBloc(),
      child: BlocBuilder<PasswordToggleBloc, AuthState>(
        builder: (context, state) => Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 140),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 380,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 39,
                                      child:
                                          Image.asset('asset/images/icon.png'),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Text(
                                        'RHEMA MENA',
                                        style: TextStyle(
                                          color: Color(0xFF707070),
                                          fontSize: 16,
                                          fontFamily: 'Helvetica Neue',
                                          fontWeight: FontWeight.w300,
                                          height: 0.09,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 380,
                                height: 650,
                                clipBehavior: Clip.antiAlias,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 24,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w700,
                                        height: 1.3,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Sign into your RHEMA MENA account.',
                                      style: TextStyle(
                                        color: Color(0xFF637381),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    Center(
                                      child: Form(
                                        key: formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 340,
                                              height: 60,
                                              child: TextFormField(
                                                obscureText: false,
                                                validator: (String? value) {
                                                  if (value!.isNotEmpty) {
                                                    return null;
                                                  }
                                                  return 'Please enter your email';
                                                },
                                                onChanged: (String input) {
                                                  emailController = input;
                                                },
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Enter email address',
                                                  labelStyle: const TextStyle(
                                                    color: Color(0xFF919EAB),
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'Helvetica Neue',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 14,
                                                          vertical: 12),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      width: 1,
                                                      color: Color(0x51919EAB),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      width: 1,
                                                      color: Color(0x51919EAB),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              width: 340,
                                              height: 60,
                                              child: TextFormField(
                                                obscureText:
                                                    state.isPasswordHidden,
                                                validator: (String? value) {
                                                  if (value!.isNotEmpty) {
                                                    return null;
                                                  }
                                                  return 'Please enter your password';
                                                },
                                                onChanged: (String input) {
                                                  passwordController = input;
                                                },
                                                decoration: InputDecoration(
                                                  labelText: 'Enter password',
                                                  labelStyle: const TextStyle(
                                                    color: Color(0xFF919EAB),
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'Helvetica Neue',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 14,
                                                          vertical: 12),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      width: 1,
                                                      color: Color(0x51919EAB),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      width: 1,
                                                      color: Color(0x51919EAB),
                                                    ),
                                                  ),
                                                  //Toggle Password State
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      state.isPasswordHidden
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                    ),
                                                    onPressed: () => context
                                                        .read<
                                                            PasswordToggleBloc>()
                                                        .add(
                                                            TogglePasswordVisibility()),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              width: 340.0,
                                              height: 48.0,
                                              child: MaterialButton(
                                                color: const Color(0xFFBE0027),
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    Auth auth = Auth(
                                                        email: emailController,
                                                        password:
                                                            passwordController,
                                                        title: '',
                                                        lastName: '',
                                                        firstName: '',
                                                        gender: '',
                                                        phone: '',
                                                        studentId: 0,
                                                        isVerified: true,
                                                        avatar: '',
                                                        status:
                                                            UserStatus.granted,
                                                        role: UserRole.student,
                                                        id: '');
                                                    context
                                                        .read<AuthBloc>()
                                                        .loginUser
                                                        .add(auth);
                                                  }
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: const Text(
                                                  'Sign in',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'Helvetica Neue',
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.3,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //Call the login stream
                                            StreamBuilder<
                                                GenericBlocState<bool>>(
                                              stream: context
                                                  .read<AuthBloc>()
                                                  .isUserloggedIn,
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.active) {
                                                  final state = snapshot.data;
                                                  if (state != null) {
                                                    switch (state.status) {
                                                      case Status.loading:
                                                        return const ProgressDialog(
                                                          title:
                                                              "Logging in...",
                                                          isProgressed: true,
                                                        );
                                                      case Status.failure:
                                                        return RetryDialog(
                                                          title: state.error ??
                                                              "Please retry",
                                                          onRetryPressed: () {
                                                            // Optionally re-trigger the login here if needed
                                                          },
                                                        );
                                                      case Status.success:
                                                        WidgetsBinding.instance!
                                                            .addPostFrameCallback(
                                                                (_) {
                                                          saveUserData(
                                                            //TODO: save email, firstName and token data from the Response body here to variable userData
                                                            '$snapshot.data',
                                                            '$snapshot.data',
                                                            '$snapshot.data',
                                                          );

                                                          takeMeToDashboardScreen(
                                                              context);
                                                        });
                                                        return const SizedBox();
                                                      case Status.empty:
                                                      default:
                                                        return const SizedBox(); // Handle the empty case or default case
                                                    }
                                                  }
                                                }
                                                return const SizedBox();
                                                //return const CircularProgressIndicator(); // Show loading by default
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () =>
                                            takeMeToPasswordResetScreen(
                                                context),
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Color(0xFF212B36),
                                            fontSize: 15,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w700,
                                            height: 0.12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 140),
                                    const Center(
                                      child: Text(
                                        'Don’t have an account?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF637381),
                                          fontSize: 12,
                                          fontFamily: 'Helvetica Neue',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Center(
                                      child: Text(
                                        'Join RHEMA MENA',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFBE0027),
                                          fontSize: 15,
                                          fontFamily: 'Helvetica Neue',
                                          fontWeight: FontWeight.w700,
                                          height: 0.12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
        ),
      ),
    );
  }
}
