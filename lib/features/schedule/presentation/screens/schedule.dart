import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/common/widget/user_drawer_widget.dart';
import 'package:rhema_mena_student_app/core/custom_icons_icons.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/no_upcoming_classes_screen.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:rhema_mena_student_app/features/attendance/presentation/screens/attendance.dart';
import 'package:rhema_mena_student_app/features/course/presentation/screens/course.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  ///
  ///
  ///
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  ///
  ///
  ///
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
      title: const Text("Class Schedule"),
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

  void gotoNoUpcomingClasses(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const NoUpcomingClasses();
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
                        const SizedBox(height: 20),

                        ///
                        /// Calendar start

                        TableCalendar<Event>(
                          firstDay: kFirstDay,
                          lastDay: kLastDay,
                          focusedDay: _focusedDay,
                          selectedDayPredicate: (day) =>
                              isSameDay(_selectedDay, day),
                          rangeStartDay: _rangeStart,
                          rangeEndDay: _rangeEnd,
                          calendarFormat: _calendarFormat,
                          rangeSelectionMode: _rangeSelectionMode,
                          eventLoader: _getEventsForDay,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          calendarStyle: const CalendarStyle(
                            // Use `CalendarStyle` to customize the UI
                            outsideDaysVisible: false,
                          ),
                          onDaySelected: _onDaySelected,
                          onRangeSelected: _onRangeSelected,
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        SizedBox(
                          height: 500,
                          child: ValueListenableBuilder<List<Event>>(
                            valueListenable: _selectedEvents,
                            builder: (context, value, _) {
                              return ListView.builder(
                                itemCount: value.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 289,
                                    height: 84,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0x0D000000),
                                          blurRadius: 6,
                                          offset: Offset(0, 1),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: ListTile(
                                      //onTap: () => print('${value[index]}'),
                                      onTap: () =>
                                          gotoNoUpcomingClasses(context),
                                      title: Text(
                                        '${value[index]}',
                                        style: const TextStyle(
                                          color: Color(0xFF171930),
                                          fontSize: 14,
                                          fontFamily: 'Helvetica Neue',
                                          fontWeight: FontWeight.w500,
                                          height: 1.3,
                                        ),
                                      ),
                                      subtitle: const Opacity(
                                        opacity: 0.60,
                                        child: Text(
                                          'Sit Dolor met ipsum',
                                          style: TextStyle(
                                            color: Color(0xFF171930),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                          ),
                                        ),
                                      ),
                                      trailing: const Opacity(
                                        opacity: 0.60,
                                        child: Text(
                                          '07:00 – 08:30',
                                          style: TextStyle(
                                            color: Color(0xFF171930),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0.19,
                                          ),
                                        ),
                                      ),
                                      leading: Container(
                                        width: 2,
                                        height: 69,
                                        decoration: ShapeDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment(0.00, -1.00),
                                              end: Alignment(0, 1),
                                              colors: [
                                                Color(0xFFE9600D),
                                                Color(0xFFF3922C),
                                                Color(0xFFFFCE50)
                                              ]),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        /// Calendar end
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
