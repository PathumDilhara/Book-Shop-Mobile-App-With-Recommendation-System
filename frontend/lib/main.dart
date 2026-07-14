import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/router/router.dart';
import 'package:frontend/core/utils/theme.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Book shop app with a recommendation system",
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}

// SVG icons : https://www.svgrepo.com/
