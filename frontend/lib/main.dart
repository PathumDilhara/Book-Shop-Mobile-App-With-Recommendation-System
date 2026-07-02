import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/router/router.dart';
import 'package:frontend/core/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Book shop app with a recommendation system",
      theme: CustomThemeData.lightTheme,
     routerConfig: AppRouter.router,
    );
  }
}
