import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhema_mena_student_app/di.dart';
import 'package:rhema_mena_student_app/core/app_theme.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/login.dart';
import 'package:rhema_mena_student_app/features/auth/presentation/screens/splash.dart';
import 'package:rhema_mena_student_app/features/course/presentation/bloc/course_bloc.dart';
import 'package:rhema_mena_student_app/features/resources/data/models/resource_model.dart';
import 'package:rhema_mena_student_app/features/resources/presentation/bloc/resources_bloc.dart';

void main() async {
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        Provider<CourseBloc>(create: (context) => getIt<CourseBloc>()),
        Provider<ResourceBloc>(create: (context) => getIt<ResourceBloc>()),
      ],
      child: MaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightAppTheme,
        //home: const Splash(title: 'Splash'),
        home: const LoginScreen(),
      ),
    );
  }
}
