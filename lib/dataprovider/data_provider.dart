import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statemgmt/models/user_model.dart';
import 'package:flutter_statemgmt/services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
