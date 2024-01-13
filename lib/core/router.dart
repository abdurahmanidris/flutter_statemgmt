// import 'package:flutter/material.dart';
import 'package:flutter_statemgmt/presentation/pages/home_page.dart';
import 'package:flutter_statemgmt/presentation/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

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
