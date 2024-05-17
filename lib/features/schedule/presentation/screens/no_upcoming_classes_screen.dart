import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/common/widget/user_drawer_widget.dart';
import 'package:rhema_mena_student_app/core/custom_icons_icons.dart';
import 'package:rhema_mena_student_app/features/attendance/presentation/screens/attendance.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/course.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/schedule.dart';

class NoUpcomingClasses extends StatefulWidget {
  const NoUpcomingClasses({super.key});

  @override
  State<NoUpcomingClasses> createState() => _NoUpcomingClassesState();
}

class _NoUpcomingClassesState extends State<NoUpcomingClasses> {
  int _selectedIndex = 0;

  PreferredSizeWidget get _appBar {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          gotoCourseScreen(context);
        },
        icon: const Icon(CupertinoIcons.back),
        color: const Color(0xffffffff),
      ),
      title: const Text("Upcoming Classes"),
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

  void openDrawer(BuildContext context) {
    _selectedIndex = 4;
    const UserDrawerWidget(); //TODO : Not firing yet
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
      openDrawer(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: _appBar,
      drawer: const UserDrawerWidget(),
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
                        const SizedBox(height: 150),
                        Center(
                          child: SizedBox(
                            width: 150,
                            height: 96,
                            child: Image.asset(
                              'asset/images/no_schedule.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // ignore: prefer_const_constructors
                        Center(
                          child: const SizedBox(
                            width: 304,
                            child: Text(
                              'There are no class scheduled available for you currently. Search your classes for more updates.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF637381),
                                fontSize: 16,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        selectedLabelStyle: theme.bottomNavigationBarTheme.selectedLabelStyle,
        unselectedLabelStyle:
            theme.bottomNavigationBarTheme.unselectedLabelStyle,
        showSelectedLabels: theme.bottomNavigationBarTheme.showSelectedLabels,
        showUnselectedLabels:
            theme.bottomNavigationBarTheme.showUnselectedLabels,
        selectedIconTheme: theme.bottomNavigationBarTheme.selectedIconTheme,
        unselectedIconTheme: theme.bottomNavigationBarTheme.unselectedIconTheme,
        useLegacyColorScheme: true,
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
