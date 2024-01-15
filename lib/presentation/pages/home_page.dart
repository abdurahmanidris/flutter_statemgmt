import 'package:flutter/material.dart';
import 'package:flutter_statemgmt/core/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String name = watch(providers.userNameProvider).state;
    // final name = ref.watch(nameProvider);
    final count = ref.watch(counterProvider);

    //using snackbar
    ref.listen(counterProvider, ((previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('The value is $next')));
      }
    }));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        //for StateProvider
        actions: [
          IconButton(
              onPressed: () {
                // ref.invalidate(counterProvider);
                ref.refresh(counterProvider);
              },
              icon: const Icon(Icons.refresh)),
        ],
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
          // Text(name),
          //reading the created Provider with Consumenr
          Consumer(builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            return Text(name);
          }),
          Text(
            // '0',
            count.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ]),
        // child: Text(name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
