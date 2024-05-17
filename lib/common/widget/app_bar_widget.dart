import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhema_mena_student_app/common/bloc/generic_bloc_state.dart';
import 'package:rhema_mena_student_app/common/dialog/progress_dialog.dart';
import 'package:rhema_mena_student_app/common/dialog/retry_dialog.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  // Widget userName(BuildContext context) {
  //   return StreamBuilder<GenericBlocState<User>>(
  //     stream: context.read<UserBloc>().userList,
  //     builder: (_, snapshot) {
  //       if (snapshot.hasData) {
  //         final state = snapshot.requireData;
  //         switch (state.status) {
  //           case Status.empty:
  //             return const SizedBox();
  //           case Status.loading:
  //             return const ProgressDialog(
  //               title: "Loading...",
  //               isProgressed: true,
  //             );
  //           case Status.failure:
  //             return RetryDialog(
  //               title: state.error ?? "Retry",
  //               onRetryPressed: () {
  //                 context.read<UserBloc>().userList.first;
  //               },
  //             );
  //           case Status.success:
  //             return Center(
  //               child: Text(
  //                 'Hi, ${state.data!.first}!',
  //                 style: const TextStyle(
  //                   color: Color(0xFFFEFEFE),
  //                   fontSize: 14,
  //                   fontFamily: 'Helvetica Neue',
  //                   fontWeight: FontWeight.w500,
  //                   height: 1.3,
  //                 ),
  //               ),
  //             );

  //           //  context
  //           //         .read<
  //           //             UserBloc>()
  //           //         .userList
  //           //         .first;
  //         }
  //       } else if (snapshot.hasError) {
  //         return SnackBar(content: Text(snapshot.error.toString()));
  //       }

  //       return const SizedBox();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 390,
      toolbarHeight: 125,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Column(
          children: [
            Container(
              width: 410,
              height: 123,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Color(0xFF3A3A3A)),
              child: Stack(
                children: [
                  Positioned(
                    left: 160,
                    top: 0,
                    child: Container(
                      width: 260,
                      height: 123,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF720017),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: -256,
                    child: Opacity(
                      opacity: 0.30,
                      child: Container(
                        width: 190,
                        height: 344,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF828282),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    top: 0,
                    child: Container(
                      width: 390,
                      height: 88,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFBE0027),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 56,
                    child: SizedBox(
                      width: 342,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: ShapeDecoration(
                              color:
                                  Colors.white.withOpacity(0.10000000149011612),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                      icon: const Icon(
                                          Icons.account_circle_rounded),
                                      iconSize: 30,
                                      tooltip: "Press to open Profile",
                                      color: const Color(0xffffffff),
                                      padding: const EdgeInsets.only(bottom: 9),
                                      onPressed: () {} //TODO: Implememt
                                      //},
                                      ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Hi, Bright!',
                                  style: TextStyle(
                                    color: Color(0xFFFEFEFE),
                                    fontSize: 14,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w500,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 137),
                          SizedBox(
                            width: 42,
                            height: 42,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    decoration: ShapeDecoration(
                                      color: Colors.white
                                          .withOpacity(0.10000000149011612),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.notifications_none_outlined),
                                  iconSize: 30,
                                  tooltip: "Press to open Profile",
                                  color: const Color(0xffffffff),
                                  padding: const EdgeInsets.only(bottom: 9),
                                  onPressed: () {
                                    //TODO: Implement
                                  },
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
          ],
        ),
      ],
    );
  }
}
