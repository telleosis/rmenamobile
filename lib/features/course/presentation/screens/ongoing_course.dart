import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/common/widget/user_drawer_widget.dart';
import 'package:rhema_mena_student_app/core/custom_icons_icons.dart';
import 'package:rhema_mena_student_app/features/attendance/presentation/screens/attendance.dart';
import 'package:rhema_mena_student_app/features/course/data/models/course_model.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/course.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/quiz.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/schedule.dart';

class OngoingCourse extends StatefulWidget {
  const OngoingCourse({
    super.key,
    required this.classEvent,
  });

  final CourseModel classEvent;

  @override
  State<OngoingCourse> createState() => _OngoingCourse();
}

class _OngoingCourse extends State<OngoingCourse> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PreferredSizeWidget get _appBar {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          gotoCourseScreen(context);
        },
        icon: const Icon(CupertinoIcons.back),
        color: const Color(0xffffffff),
      ),
      title: const Text("Ongoing Course"),
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

  void gotoQuizScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const QuizScreen();
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

  void overviewBottomsheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              height: 400,
              child: Column(
                children: [
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
                  const SizedBox(
                    width: 253,
                    child: Text(
                      'Pneumatology Basics',
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontSize: 24,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.00),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 0.0),
                    child: SizedBox(
                      width: 355,
                      child: Text(
                        'The UX Master Class is a comprehensive and immersive course designed to equip participants with the knowledge and skills necessary to create exceptional user experiences. In today\'s digital landscape, user experience (UX) has emerged as a critical factor in determining the success of any product or service. This course is tailored for both aspiring UX designers seeking to establish a strong foundation and experienced professionals aiming to refine their expertise.',
                        style: TextStyle(
                          color: Color(0xFF637381),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void gradeBottomsheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              height: 300,
              child: Column(
                children: [
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
                  Container(
                    width: 131,
                    height: 96,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage('asset/images/course_img_2.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 0.0),
                    child: SizedBox(
                      width: 120,
                      child: Text(
                        'Pneumatology 1',
                        style: TextStyle(
                          color: Color(0xFF212B36),
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.00),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 0.0),
                    child: SizedBox(
                      width: 120,
                      child: Text(
                        'Level 1・3.45 (A)',
                        style: TextStyle(
                          color: Color(0xFF637381),
                          fontSize: 14,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void resourcesBottomsheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              height: 300,
              child: Column(
                children: [
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
                  Card(
                    color: const Color(0xFFFFFFFF),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                            title: const SizedBox(
                              width: 184,
                              child: Text(
                                'Learning to Lead Yourself',
                                style: TextStyle(
                                  color: Color(0xFF212B36),
                                  fontSize: 14,
                                  fontFamily: 'Helvetica Neue',
                                  fontWeight: FontWeight.w500,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            subtitle: const SizedBox(
                              width: 173,
                              child: Text(
                                '.pdf',
                                style: TextStyle(
                                  color: Color(0xFF637381),
                                  fontSize: 12,
                                  fontFamily: 'Helvetica Neue',
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            leading: Container(
                              width: 56,
                              height: 56,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'asset/images/resources_icon.png'),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            trailing: const Icon(
                              CupertinoIcons.mic_solid,
                              color: Color(0xFF333333),
                              size: 24,
                            ),
                            onTap: () => {}
                            //TODO
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar,
      drawer: const UserDrawerWidget(),
      backgroundColor: const Color(0xFFF4F6F8),
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
                        SizedBox(
                          width: 400,
                          child: Card(
                            color: const Color(0xFFFFFFFF),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 380,
                                  height: 240,
                                  child: Image.asset(
                                    'asset/images/course_player.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Divider(),
                                ListTile(
                                    leading: const Text(
                                      'Course Content',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 18,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w700,
                                        height: 1.3,
                                      ),
                                    ),
                                    trailing: const SizedBox(
                                      width: 140.0,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Mark as done',
                                            style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 1.3,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Icon(
                                            CupertinoIcons.checkmark_alt_circle,
                                            color: Color(0xFF333333),
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () => {}
                                    //gotoOngoingCourseScreen(context),
                                    ),
                                const Divider(
                                  height: 24.0,
                                  thickness: 2.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                                ListTile(
                                    title: const Text(
                                      'Session 1. Pneumatology I',
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 16,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      '50min',
                                      style: TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    leading: const Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: Color(0xFF7F7F7F),
                                    ),
                                    onTap: () => {}
                                    //gotoOngoingCourseScreen(context),
                                    ),
                                const Divider(
                                  height: 24.0,
                                  thickness: 2.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                                ListTile(
                                    title: const Text(
                                      'Session 2. Pneumatology I',
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 16,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      '50min',
                                      style: TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    leading: const Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: Color(0xFF7F7F7F),
                                    ),
                                    onTap: () => {}
                                    //gotoOngoingCourseScreen(context),
                                    ),
                                const Divider(
                                  height: 24.0,
                                  thickness: 2.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                                ListTile(
                                    title: const Text(
                                      'Session 3. Pneumatology I',
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 16,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      '50min',
                                      style: TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    leading: const Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: Color(0xFF7F7F7F),
                                    ),
                                    onTap: () => {}
                                    //gotoOngoingCourseScreen(context),
                                    ),
                                const Divider(
                                  height: 24.0,
                                  thickness: 2.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                                ListTile(
                                    title: const Text(
                                      'Session 4. Pneumatology I',
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 16,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      '50min',
                                      style: TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    leading: const Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: Color(0xFF7F7F7F),
                                    ),
                                    onTap: () => {}
                                    //gotoOngoingCourseScreen(context),
                                    ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /**
                     * we use a CustomScrollView and Slivers to create a layout that is 
                     * scrollable on small screens but has flexible space at the bottom 
                     * on big screens.
                     */
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 72),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFBEBEBE),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  SizedBox(
                    width: 380,
                    height: 62,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 125.0,
                                height: 20.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    overviewBottomsheet();
                                  },
                                  child: const Text(
                                    'Overview',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF637381),
                                      fontSize: 14,
                                      fontFamily: 'Helvetica Neue',
                                      fontWeight: FontWeight.w500,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70.0,
                                height: 20.0,
                                child: MaterialButton(
                                  onPressed: () => gotoQuizScreen(context),
                                  child: const Text(
                                    'Exam',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF637381),
                                      fontSize: 14,
                                      fontFamily: 'Helvetica Neue',
                                      fontWeight: FontWeight.w500,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100.0,
                                height: 20.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    resourcesBottomsheet();
                                  },
                                  child: const Text(
                                    'Resources',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF637381),
                                      fontSize: 14,
                                      fontFamily: 'Helvetica Neue',
                                      fontWeight: FontWeight.w500,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 80.0,
                                height: 20.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    gradeBottomsheet();
                                  },
                                  child: const Text(
                                    'Grades',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF637381),
                                      fontSize: 14,
                                      fontFamily: 'Helvetica Neue',
                                      fontWeight: FontWeight.w500,
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
                  const SizedBox(height: 30),
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
