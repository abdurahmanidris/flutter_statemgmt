import 'package:flutter/material.dart';
import 'package:flutter_statemgmt/core/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = AppRouter.configureRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerDelegate: _router.routerDelegate,
      // routeInformationParser: _router.routeInformationParser,
      routerConfig: _router,
      title: 'Go router',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_statemgmt/home_page.dart';
import 'package:flutter_statemgmt/settings_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Go router',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  final GoRouter _router = GoRouter(
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
}*/
