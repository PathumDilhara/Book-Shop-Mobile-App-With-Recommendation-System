import 'package:frontend/core/router/router_paths.dart';
import 'package:frontend/features/explore/screens/explore_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/${RouterPaths.exploreScreen}",
    routes: [
      // Explore Screen
      GoRoute(
        name: RouterPaths.exploreScreen,
        path: "/${RouterPaths.exploreScreen}",
        builder: (context, state) => ExploreScreen(),
      ),
    ],
  );
}
