import 'package:frontend/core/bottom_navigation/bottom_navigation.dart';
import 'package:frontend/core/router/router_paths.dart';
import 'package:frontend/features/check_out/screens/check_out_screen.dart';
import 'package:frontend/features/explore/screens/explore_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/${RouterPaths.bottomNavigation}",
    routes: [
      // Bottom Nav bar
      GoRoute(
        name: RouterPaths.bottomNavigation,
        path: "/${RouterPaths.bottomNavigation}",
        builder: (context, state) => BottomNavigationScreen(),
      ),

      // Explore Screen
      GoRoute(
        name: RouterPaths.exploreScreen,
        path: "/${RouterPaths.exploreScreen}",
        builder: (context, state) => ExploreScreen(),
      ),

      // Checkout screen
      GoRoute(
        path: "/${RouterPaths.checkOut}",
        builder: (context, state) => CheckOutScreen(),
      ),
    ],
  );
}
