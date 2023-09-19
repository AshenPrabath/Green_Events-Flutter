import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:flutter/scheduler.dart';
import 'package:application8/theme/theme_helper.dart';
import 'package:application8/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'application8',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.enterCardDetailsScreen,
      routes: AppRoutes.routes,
    );
  }
}
