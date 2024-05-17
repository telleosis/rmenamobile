import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/common/widget/user_drawer_widget.dart';
import 'package:rhema_mena_student_app/core/custom_icons_icons.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/course.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/schedule.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
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
      title: const Text("Attendance Record"),
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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
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
                        const SizedBox(height: 10),
                        Container(
                          width: 343,
                          height: 76,
                          //padding: const EdgeInsets.all(16),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x05000000),
                                blurRadius: 110,
                                offset: Offset(0, 55),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 110,
                                offset: Offset(0, 55),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const ListTile(
                            //onTap: () => do nothing
                            title: Text(
                              'Pneumatology 1',
                              style: TextStyle(
                                color: Color(0xFF212B36),
                                fontSize: 16,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                            ),
                            subtitle: Text(
                              'Attended ・ April 17, 2023',
                              style: TextStyle(
                                color: Color(0xFF637381),
                                fontSize: 12,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                            ),
                            trailing: Text(
                              '12:30 am',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF212B36),
                                fontSize: 14,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                            ),
                            leading: Icon(
                              CupertinoIcons.checkmark_square_fill,
                              color: Color(0xFFE9FCD4),
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 343,
                          height: 76,
                          //padding: const EdgeInsets.all(16),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x05000000),
                                blurRadius: 110,
                                offset: Offset(0, 55),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 110,
                                offset: Offset(0, 55),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const ListTile(
                            //onTap: () => do nothing
                            title: Text(
                              'Manifestations of the Spirit',
                              style: TextStyle(
                                color: Color(0xFF212B36),
                                fontSize: 16,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                            ),
                            subtitle: Text(
                              'Missed ・ May 17, 2023',
                              style: TextStyle(
                                color: Color(0xFF637381),
                                fontSize: 12,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                            ),
                            trailing: Text(
                              '12:30 am',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF212B36),
                                fontSize: 14,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                            ),
                            leading: Icon(
                              CupertinoIcons.xmark_square_fill,
                              color: Color(0xFFFFE7D9),
                              size: 40,
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
