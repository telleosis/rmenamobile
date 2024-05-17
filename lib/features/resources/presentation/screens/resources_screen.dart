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
import 'package:rhema_mena_student_app/features/course/presentation/screens/course.dart';
import 'package:rhema_mena_student_app/features/dashboard/presentation/screens/dashboard.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/bloc/resources_bloc.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/bloc/resources_event.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/widgets/audio_resources_widget.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/widgets/video_resources_widget.dart';
import 'package:rhema_mena_student_app/features/schedule/presentation/screens/schedule.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PreferredSizeWidget get _appBar {
    return AppBar(
      backgroundColor: const Color(0xFF3A3A3A),
      toolbarHeight: 160.0,
      title: const Text(
        'Resources',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontFamily: 'Helvetica Neue',
          fontWeight: FontWeight.w700,
          height: 1.3,
        ),
        textAlign: TextAlign.left,
      ),
      bottom: TabBar(
        controller: _tabController,
        tabs: const <Widget>[
          Tab(
            child: SizedBox(
              width: 39,
              height: 22,
              child: Text(
                'Notes PDF',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 38,
              height: 22,
              child: Text(
                'Audio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontSize: 14,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 44,
              height: 22,
              child: Text(
                'Videos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontSize: 14,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 70,
              height: 22,
              child: Text(
                'Newsletter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontSize: 14,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
          )
        ],
      ),
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

  late final TabController _tabController;

  // Widget pdfResources() {
  //   Widget createCard() {
  //     return SizedBox(
  //       width: 164,
  //       height: 244,
  //       child: Card(
  //         color: const Color(0xFFFFFFFF),
  //         clipBehavior: Clip.antiAlias,
  //         child: Padding(
  //           padding: const EdgeInsets.only(top: 8.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                 width: 164,
  //                 height: 170,
  //                 decoration: ShapeDecoration(
  //                   image: const DecorationImage(
  //                     image: AssetImage('asset/images/res_thumbnail_1.png'),
  //                     fit: BoxFit.fill,
  //                   ),
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8)),
  //                 ),
  //               ),
  //               const ListTile(
  //                 title: Text(
  //                   'Learning to Lead Yourself',
  //                   style: TextStyle(
  //                     color: Color(0xFF212B36),
  //                     fontSize: 14,
  //                     fontFamily: 'Helvetica Neue',
  //                     fontWeight: FontWeight.w500,
  //                     height: 1.3,
  //                   ),
  //                 ),
  //                 subtitle: Text(
  //                   '3 mins read ・ Pastor Matt',
  //                   style: TextStyle(
  //                     color: Color(0xFF637381),
  //                     fontSize: 12,
  //                     fontFamily: 'Helvetica Neue',
  //                     fontWeight: FontWeight.w400,
  //                     height: 1.3,
  //                   ),
  //                 ),
  //                 //TODO: onTap: () => gotoResource(context),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   return GridView.builder(
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       childAspectRatio: (164 / 260),
  //       crossAxisSpacing: 10,
  //       mainAxisSpacing: 10,
  //     ),
  //     itemCount: 6,
  //     itemBuilder: (context, index) {
  //       return createCard();
  //     },
  //   );
  // }

  Widget pdfResources(ResourceModel resource) {
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
                resource.avatar ?? 'asset/images/res_thumbnail_1.png',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                resource.name ?? 'This is a resource item',
                style: const TextStyle(
                  color: Color(0xFF212B36),
                  fontSize: 16,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              trailing: const Icon(
                CupertinoIcons.chevron_right_circle_fill,
                color: Color(0xFFBE0027),
                size: 34,
              ),
              //TODO: onTap() => gotoResource(context),
            ),
          ],
        ),
      ),
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
        .read<ResourceBloc>()
        .refreshResourceList
        .add(const ResourcesListFetched());
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    context.read<ResourceBloc>().dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar,
      drawer: const UserDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Center(
                    child: StreamBuilder<GenericBlocState<ResourceModel>>(
                      stream: context.read<ResourceBloc>().resourceList,
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          final resourceState = snapshot.requireData;
                          switch (resourceState.status) {
                            case Status.empty:
                              return const EmptyWidget(
                                  message: "No Resource Uploaded Yet!");
                            case Status.loading:
                              return const SpinKitIndicator(
                                  type: SpinKitType.circle);
                            case Status.failure:
                              return RetryDialog(
                                title: resourceState.error ?? "Error",
                                onRetryPressed: () {
                                  context
                                      .read<ResourceBloc>()
                                      .refreshResourceList
                                      .add(const ResourcesListFetched());
                                },
                              );
                            case Status.success:
                              //TODO: Refactor this to GridView latere
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: resourceState.data?.length ?? 0,
                                itemBuilder: (_, index) {
                                  ResourceModel resourceList =
                                      resourceState.data![index];
                                  return pdfResources(resourceList);
                                },
                              );
                          }
                        } else if (snapshot.hasError) {
                          return RetryDialog(
                            title: snapshot.error.toString(),
                            onRetryPressed: () {
                              context
                                  .read<ResourceBloc>()
                                  .refreshResourceList
                                  .add(const ResourcesListFetched());
                            },
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SpinKitIndicator(
                              type: SpinKitType.circle);
                        } else {
                          return const Text("Unknown state");
                        }
                      },
                    ),
                  ),
                  Center(
                    child: audioResources(), //Text("AUdio content"),
                  ),
                  Center(
                    child: videoResources(), //Text("Video content"),
                  ),
                  const Center(
                    child: Text("Newsletter"), //newsResources(),
                  ),
                ],
              ),
            ),
          ],
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
