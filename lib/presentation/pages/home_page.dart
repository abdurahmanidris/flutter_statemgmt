import 'package:flutter/material.dart';
import 'package:flutter_statemgmt/core/router.dart';
import 'package:flutter_statemgmt/core/counter_demo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final counterProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String name = watch(providers.userNameProvider).state;
    // final name = ref.watch(nameProvider);
    // final count = ref.watch(counterProvider);
    final counter = ref.watch(counterProvider);

    //using snackbar
    /*ref.listen(counterProvider, ((previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('The value is $next')));
      }
    }));*/

    return Scaffold(
      appBar: AppBar(
        title: const Text("StateNotifierProvider"),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () => context.goNamed(
              "settings",
              pathParameters: {"name": "codemagic"},
            ),
            child: const Text('Go to Settings page'),
          ),
          Text(
            '$counter',
            style: const TextStyle(fontSize: 25),
          ),
        ]),
        // child: Text(name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
