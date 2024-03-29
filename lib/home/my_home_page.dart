import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statemgmt/dataprovider/data_provider.dart';
import 'package:flutter_statemgmt/features/drawer_widget.dart';
import 'package:flutter_statemgmt/models/user_model.dart';
import 'package:flutter_statemgmt/screens/detail_screen.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    e: userList[index],
                                  ),
                                ),
                              ),
                              child: Card(
                                color: Colors.blue,
                                elevation: 4,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text(
                                    userList[index].firstname,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    userList[index].lastname,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  trailing: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(userList[index].avatar)),
                                ),
                              ),
                            );
                          })),
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
