import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/common/widget/app_bar_widget.dart';
import 'package:rhema_mena_student_app/common/widget/user_drawer_widget.dart';
import 'package:rhema_mena_student_app/core/custom_icons_icons.dart';
import 'package:rhema_mena_student_app/features/attendance/presentation/screens/attendance.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/course.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/schedule.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    callDownloadScheduleAPI(context) {} //TODO: Implement function

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(125),
        child: AppBarWidget(),
      ),
      drawer: const UserDrawerWidget(),
      backgroundColor: const Color(0xFFF4F6F8),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0),
                      SizedBox(
                        child: Row(
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE6F0EE)),
                              ),
                              child: Container(
                                width: 175,
                                height: 120,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '2/5',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 20,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFE7EC),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: FractionallySizedBox(
                                              widthFactor:
                                                  .33, // Example fraction of 33%
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFBE0027),
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'Attendance',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'Summary',
                                      style: TextStyle(
                                        color: Color(0xFF637381),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE6F0EE)),
                              ),
                              child: Container(
                                width: 175,
                                height: 120,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '3/4',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 20,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF4F4F4),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: FractionallySizedBox(
                                              widthFactor:
                                                  .33, // Example fraction of 33%
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF3A3A3A),
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'Results',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'Summary',
                                      style: TextStyle(
                                        color: Color(0xFF637381),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: const Color(0xFFFFF7CD),
                          child: Container(
                            //width: 370,
                            height: 129,
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 12,
                              right: 93,
                              bottom: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Pending payment',
                                  style: TextStyle(
                                    color: Color(0xFF212B36),
                                    fontSize: 14,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'You have a pending payment of \$5 to make',
                                        style: TextStyle(
                                          color: Color(0xFF637381),
                                          fontSize: 12,
                                          fontFamily: 'Helvetica Neue',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                InkWell(
                                  onTap: () {
                                    // Add your onTap functionality here
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFBE0027),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Pay Fee',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                        child: Center(
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    'Schedule',
                                    style: TextStyle(
                                      color: Color(0xFF212B36),
                                      fontSize: 18,
                                      fontFamily: 'Helvetica Neue',
                                      fontWeight: FontWeight.w700,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 30,
                                    padding: const EdgeInsets.fromLTRB(
                                        100.0, 4.0, 4.0, 4.0),
                                    // decoration: ShapeDecoration(
                                    //   shape: RoundedRectangleBorder(
                                    //       borderRadius: BorderRadius.circular(8)),
                                    // ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                              Icons.file_download_outlined),
                                          iconSize: 18,
                                          tooltip: "Press to Download",
                                          color: const Color(0xFF212B36),
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          onPressed: () =>
                                              callDownloadScheduleAPI(context),
                                        ),
                                        const Text(
                                          'Download pdf',
                                          style: TextStyle(
                                            color: Color(0xFF212B36),
                                            fontSize: 13,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w700,
                                            height: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: 270,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    tileColor: const Color(0xFFFFFFFF),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFF4F6F8)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    trailing: const Text(
                                      '6th October',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    title: const Text(
                                      'Team',
                                      style: TextStyle(
                                        color: Color(0xFF637381),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      'Jump into RHEMA',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    leading: const Icon(
                                      CupertinoIcons.hifispeaker,
                                      color: Color(0xFF9E86FF),
                                    ),
                                  ),
                                  // const Divider(),
                                  ListTile(
                                    tileColor: const Color(0xFFFFFFFF),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFF4F6F8)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    title: const Text(
                                      'Team',
                                      style: TextStyle(
                                        color: Color(0xFF637381),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      'Jump into RHEMA',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    leading: Icon(
                                      CupertinoIcons.hifispeaker,
                                      color: Colors.blue[500],
                                    ),
                                  ),
                                  ListTile(
                                    tileColor: const Color(0xFFFFFFFF),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFF4F6F8)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    trailing: const Text(
                                      '20th October',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                    title: const Text(
                                      'Matthew Beemer & Brad Spangler',
                                      style: TextStyle(
                                        color: Color(0xFF637381),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      'Pneumatology',
                                      style: TextStyle(
                                        color: Color(0xFF212B36),
                                        fontSize: 12,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                    leading: const Icon(
                                      CupertinoIcons.hifispeaker,
                                      color: Color(0xFFE02D69),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 12.0, 10.0, 12.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Events',
                                  style: TextStyle(
                                    color: Color(0xFF212B36),
                                    fontSize: 18,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w700,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          SizedBox(
                            //width: 343,
                            height: 270,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    tileColor: const Color(0xFFFFFFFF),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFF4F6F8)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    title: const Text(
                                      'Virtual STEM Clubs for Gr 4-9 with Destination Exploration',
                                      style: TextStyle(
                                        color: Color(0xFF203B54),
                                        fontSize: 14,
                                        fontFamily: 'Helvetica Neue',
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                    subtitle: const Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Wed, Feb 24, 2023;  ',
                                            style: TextStyle(
                                              color: Color(0xFF4D6276),
                                              fontSize: 12,
                                              fontFamily: 'Helvetica Neue',
                                              fontWeight: FontWeight.w400,
                                              height: 1.3,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '12:00 pm - 1:00 pm',
                                            style: TextStyle(
                                              color: Color(0xFF798998),
                                              fontSize: 12,
                                              fontFamily: 'Helvetica Neue',
                                              fontWeight: FontWeight.w400,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    leading: const Icon(
                                      CupertinoIcons.ticket,
                                      color: Color(0xFF9E86FF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
