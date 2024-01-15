import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_statemgmt/core/counter_demo.dart';
import 'package:flutter_statemgmt/core/router.dart';
import 'package:go_router/go_router.dart';

/*final counterProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());*/
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/*class MyApp extends StatelessWidget {
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
}*/

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final GoRouter _router = AppRouter.configureRoutes();

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
}
