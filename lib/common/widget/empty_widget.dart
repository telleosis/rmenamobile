import 'package:flutter/material.dart';
import 'package:rhema_mena_student_app/core/app_asset.dart';
import 'package:rhema_mena_student_app/core/app_style.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppAsset.emptyState),
          Text(message, style: headLine1),
        ],
      ),
    );
  }
}
