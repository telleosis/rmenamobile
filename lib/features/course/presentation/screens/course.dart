import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhema_mena_student_app/common/bloc/generic_bloc_state.dart';
import 'package:rhema_mena_student_app/common/dialog/retry_dialog.dart';
import 'package:rhema_mena_student_app/common/widget/empty_widget.dart';
import 'package:rhema_mena_student_app/common/widget/spinkit_indicator.dart';
import 'package:rhema_mena_student_app/common/widget/user_drawer_widget.dart';
import 'package:rhema_mena_student_app/core/custom_icons_icons.dart';
import 'package:rhema_mena_student_app/features/attendance/presentation/screens/attendance.dart';
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';
import 'package:rhema_mena_student_app/features/course/presentation/bloc/course_bloc.dart';
import 'package:rhema_mena_student_app/features/course/presentation/bloc/course_event.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/ongoing_course.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/schedule.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PreferredSizeWidget get _appBar {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          gotoDashboardScreen(context);
        },
        icon: const Icon(CupertinoIcons.back),
        color: const Color(0xffffffff),
      ),
      title: const Text("My Courses"),
    );
  }

  void gotoDashboardScreen(context) {
    _selectedIndex = 0;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const Dashboard();
    }), (Route<dynamic> route) => false);
  }

  void gotoCourseScreen(BuildContext context) {
    _selectedIndex = 1;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const Course();
      }),
      (Route<dynamic> route) => false,
    );
  }

  void gotoScheduleScreen(BuildContext context) {
    _selectedIndex = 2;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const Schedule();
      }),
      (Route<dynamic> route) => false,
    );
  }

  void gotoAttendanceScreen(BuildContext context) {
    _selectedIndex = 3;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const Attendance();
      }),
      (Route<dynamic> route) => false,
    );
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      gotoDashboardScreen(context);
    }
    if (index == 1) {
      gotoCourseScreen(context);
    }
    if (index == 2) {
      gotoScheduleScreen(context);
    }
    if (index == 3) {
      gotoAttendanceScreen(context);
    }
    if (index == 4) {
      setState(() {
        _selectedIndex = index;

        if (_selectedIndex == 4 && _scaffoldKey.currentState != null) {
          _scaffoldKey.currentState!.openDrawer();
        }
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // void gotoOngoingCourseScreen(BuildContext context) {
  //   Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (context) {
  //       return const OngoingCourse();
  //     }),
  //     (Route<dynamic> route) => false,
  //   );
  // }

  Widget courseListItem(CourseModel course) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 332,
              height: 180,
              child: Image.network(
                course.avatar ?? 'asset/images/res_thumbnail_1.png',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                course.title,
                style: const TextStyle(
                  color: Color(0xFF212B36),
                  fontSize: 16,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Course Level: ',
                      style: TextStyle(
                        color: Color(0xFF637381),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: 0.05,
                      ),
                    ),
                    TextSpan(
                      text: course.level,
                      style: const TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: 0.05,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: const Icon(
                CupertinoIcons.chevron_right_circle_fill,
                color: Color(0xFFBE0027),
                size: 34,
              ),
              onTap: () => courseBottomsheet(),
            ),
          ],
        ),
      ),
    );
  }

  //for keep - navigateTo(OngoingCourse(classEvent: course))
  void courseBottomsheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Card(
              child: SizedBox(
                width: 400,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 15),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFBEBEBE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 360,
                      height: 200,
                      child: Image.asset(
                        //course.avatar ?? 'asset/images/res_thumbnail_1.png',
                        'asset/images/course_img_1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        //course.title
                        'Jump into RHEMA/ Orientation',
                        style: TextStyle(
                          color: Color(0xFF212B36),
                          fontSize: 18,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w700,
                          height: 1.8,
                        ),
                      ),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Instructor: ',
                              style: TextStyle(
                                color: Color(0xFF637381),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                letterSpacing: 0.05,
                              ),
                            ),
                            TextSpan(
                              //text: course.level,
                              text: 'Matt Beemer',
                              style: TextStyle(
                                color: Color(0xFF212B36),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                letterSpacing: 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              //text: course.session,
                              text: '12 ',
                              style: TextStyle(
                                color: Color(0xFF212B36),
                                fontSize: 24,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
                                height: 1.8,
                              ),
                            ),
                            TextSpan(
                              text: 'Sessions',
                              style: TextStyle(
                                color: Color(0xFF212B36),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                letterSpacing: 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: 390,
                      height: 70,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 11),
                      child: MaterialButton(
                        color: const Color(0xFFBE0027),
                        onPressed: () {
                          // if (formKey.currentState!.validate()) {
                          //   context.read<AuthBloc>().loginUser.add(auth);
                          // }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Start Course',
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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
  void initState() {
    context
        .read<CourseBloc>()
        .refereshCourseList
        .add(const CourseListFetched());
    super.initState();
  }

  @override
  void dispose() {
    context.read<CourseBloc>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar,
      drawer: const UserDrawerWidget(),
      backgroundColor: const Color(0xFFF4F6F8),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<GenericBlocState<CourseModel>>(
          stream: context.read<CourseBloc>().courseList,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final courseState = snapshot.requireData;
              switch (courseState.status) {
                case Status.empty:
                  return const EmptyWidget(message: "No Courses Uploaded Yet!");
                case Status.loading:
                  return const SpinKitIndicator(type: SpinKitType.circle);
                case Status.failure:
                  return RetryDialog(
                    title: courseState.error ?? "Error",
                    onRetryPressed: () {
                      context
                          .read<CourseBloc>()
                          .refereshCourseList
                          .add(const CourseListFetched());
                    },
                  );
                case Status.success:
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: courseState.data?.length ?? 0,
                    itemBuilder: (_, index) {
                      CourseModel courseList = courseState.data![index];
                      return courseListItem(courseList);
                    },
                  );
              }
            } else if (snapshot.hasError) {
              return RetryDialog(
                title: snapshot.error.toString(),
                onRetryPressed: () {
                  context
                      .read<CourseBloc>()
                      .refereshCourseList
                      .add(const CourseListFetched());
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const SpinKitIndicator(type: SpinKitType.circle);
            } else {
              return const Text("Unknown state");
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        selectedIconTheme: theme.bottomNavigationBarTheme.selectedIconTheme,
        selectedLabelStyle: theme.bottomNavigationBarTheme.selectedLabelStyle,
        showSelectedLabels: theme.bottomNavigationBarTheme.showSelectedLabels,
        showUnselectedLabels:
            theme.bottomNavigationBarTheme.showUnselectedLabels,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.ic_layout_grid),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tv_music_note),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2_square_stack),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.line_horizontal_3),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
