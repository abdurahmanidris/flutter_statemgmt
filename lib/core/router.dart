// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statemgmt/presentation/pages/home_page.dart';
import 'package:flutter_statemgmt/presentation/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

// declared a global StateProvider so that it is easier to maintain the project
//ref used to read other providers
/*final userNameProvider = StateProvider((ref) {
  return "SomeName";
});*/

final nameProvider = Provider<String>((ref) {
  return 'Hello Abdurahman!';
});

final counterProvider = StateProvider((ref) => 0);

class AppRouter {
  static GoRouter configureRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          name: "home",
          path: "/",
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              name: "settings",
              path: "settings/:name",
              builder: (context, state) => SettingsPage(
                name: state.pathParameters["name"]!,
              ),
            )
          ],
        ),
      ],
    );
  }
}
