import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhema_mena_student_app/common/bloc/generic_bloc_state.dart';
import 'package:rhema_mena_student_app/common/dialog/progress_dialog.dart';
import 'package:rhema_mena_student_app/common/dialog/retry_dialog.dart';
import 'package:rhema_mena_student_app/common/widget/spinkit_indicator.dart';
import 'package:rhema_mena_student_app/core/app_extension.dart';
import 'package:rhema_mena_student_app/features/auth/data/models/auth.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/login.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/screens/resources_screen.dart';

class UserDrawerWidget extends StatefulWidget {
  const UserDrawerWidget({super.key});

  @override
  State<UserDrawerWidget> createState() => _UserDrawerWidgetState();
}

class _UserDrawerWidgetState extends State<UserDrawerWidget> {
  printDisplayName(context) {
    //TODO: implement function
  }

  printDisplayEmail(context) {
    //TODO: implement function
  }

  void gotoResourcesScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const ResourcesScreen();
      }),
      (Route<dynamic> route) => false,
    );
  }

  void gotoLoginScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }),
      (Route<dynamic> route) => false,
    );
  }

//TODO: refactor the Auth entity in this logout function to use the DisplayUser function of the AuthBloc
  void logoutUser(Auth? user) async {
    if (user == null) return;
    bool isLogout = true;
    if (isLogout) {
      context.read<AuthBloc>().logoutUser.add(user);
      showDialog(
        context: context,
        builder: (_) {
          return StreamBuilder<GenericBlocState<bool>>(
            stream: context.read<AuthBloc>().isUserLoggedOut,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                final userState = snapshot.data;
                if (userState == null) return const SizedBox();
                switch (userState.status) {
                  case Status.loading:
                    return const SpinKitIndicator(type: SpinKitType.circle);
                  case Status.failure:
                    return RetryDialog(
                      title: userState.error ?? "Error",
                      onRetryPressed: () {
                        context.read<AuthBloc>().logoutUser.add(user);
                      },
                    );
                  case Status.success:
                    gotoLoginScreen(context);
                    return const SizedBox();
                  case Status.empty:
                  // TODO: Handle this case.
                }
              } else if (snapshot.hasError) {
                return SnackBar(content: Text(snapshot.error.toString()));
              }
              return const SpinKitIndicator(type: SpinKitType.circle);
            },
          );
        },
      );
    }
  }

  Widget logoutListTile(Auth? user) {
    if (user == null) {
      return const SizedBox();
    }

    return ListTile(
      title: SizedBox(
        width: 49.0,
        height: 30.0,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: 8.0,
              height: 8.0,
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(CupertinoIcons.square_arrow_left),
                    iconSize: 20,
                    color: const Color(0xff343c70),
                    onPressed: () {
                      //TODO
                    },
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(35.7, 10.1),
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Color(0xFF212B36),
                  fontSize: 14,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return ProgressDialog(
              title: "Are you you want to Sign out?",
              onPressed: () {
                logoutUser(user);
              },
              isProgressed: false,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                iconSize: 40,
                color: const Color(0xffd1d1d1),
                alignment: Alignment.bottomLeft,
                onPressed: () {
                  Navigator.pop(context);
                }),
            decoration: const BoxDecoration(
              color: Color(0xFF3A3A3A),
            ),
            accountName: const Text(
              'Jack Robinson',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ), //TODO: printDisplayName(context),
            accountEmail: const Text(
              'jack@rhemaconnect.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ), //TODO: printDisplayEmail(context),
          ListTile(
            title: SizedBox(
              width: 49.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                    height: 8.0,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(CupertinoIcons.creditcard),
                            iconSize: 20,
                            color: const Color(0xff343c70),
                            onPressed: () {
                              //TODO:
                            }),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(35.7, 10.1),
                    child: const Text(
                      'Tuition',
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              //TODO: Implement
            },
          ),
          ListTile(
            title: SizedBox(
              width: 49.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                    height: 8.0,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(
                                CupertinoIcons.bubble_left_bubble_right),
                            iconSize: 20,
                            color: const Color(0xff343c70),
                            onPressed: () {
                              //TODO: Implement
                            }),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(35.7, 10.1),
                    child: const Text(
                      'Community',
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              //TODO: Implement
            },
          ),
          ListTile(
            title: SizedBox(
              width: 49.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                    height: 8.0,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(CupertinoIcons.circle_grid_hex),
                            iconSize: 20,
                            color: const Color(0xff343c70),
                            onPressed: () {
                              //TODO
                            }),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(35.7, 10.1),
                    child: const Text(
                      'Resources',
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              gotoResourcesScreen(context);
            },
          ),
          ListTile(
            title: SizedBox(
              width: 49.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                    height: 8.0,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(CupertinoIcons.doc_plaintext),
                            iconSize: 20,
                            color: const Color(0xff343c70),
                            onPressed: () {
                              //TODO
                            }),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(35.7, 10.1),
                    child: const Text(
                      'Academic Report',
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              //TODO
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: ListTile(
              title: SizedBox(
                width: 49.0,
                height: 30.0,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 8.0,
                      height: 8.0,
                      child: Stack(
                        children: <Widget>[
                          IconButton(
                              icon: const Icon(CupertinoIcons.question_circle),
                              iconSize: 20,
                              color: const Color(0xff343c70),
                              onPressed: () {
                                //TODO
                              }),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(35.7, 10.1),
                      child: const Text(
                        'Help Desk',
                        style: TextStyle(
                          color: Color(0xFF212B36),
                          fontSize: 14,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                //TODO
              },
            ),
          ),
          ListTile(
            title: SizedBox(
              width: 49.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                    height: 8.0,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(CupertinoIcons.settings),
                            iconSize: 20,
                            color: const Color(0xff343c70),
                            onPressed: () {
                              //TODO
                            }),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(35.7, 10.1),
                    child: const Text(
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              //TODO
            },
          ),

          ListTile(
            title: SizedBox(
              width: 49.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                    height: 8.0,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(CupertinoIcons.chat_bubble),
                            iconSize: 20,
                            color: const Color(0xff343c70),
                            onPressed: () {
                              //TODO
                            }),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(35.7, 10.1),
                    child: const Text(
                      'English (United States)',
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              //TODO
            },
          ),

          const SizedBox(height: 20),

          //logoutListTile(user),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
