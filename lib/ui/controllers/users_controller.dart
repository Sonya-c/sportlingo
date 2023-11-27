import 'dart:async';

import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import '../../data/model/user.dart';
import 'package:firebase_database/firebase_database.dart';

class UsersController extends GetxController {
  final _users = <User>[].obs;
  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;
  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  get users {
    AuthController authController = Get.find();
    return _users
        .where((entry) => entry.uid != authController.getUid())
        .toList();
  }

  get allUsers => _users;

  void start() {
    _users.clear();

    newEntryStreamSubscription =
        databaseRef.child("users").onChildAdded.listen(_onEntryAdded);

    updateEntryStreamSubscription =
        databaseRef.child("users").onChildChanged.listen(_onEntryChanged);
  }

  void stop() {
    newEntryStreamSubscription.cancel();
    updateEntryStreamSubscription.cancel();
  }

  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _users.add(User.fromJson(event.snapshot, json));
  }

  // cuando obtenemos un evento con un usuario modificado lo reemplazamos en _users
  // usando el key como llave
  _onEntryChanged(DatabaseEvent event) {
    var oldEntry = _users.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _users[_users.indexOf(oldEntry)] = User.fromJson(event.snapshot, json);
  }

  Future<void> _loadUsers() async {
    databaseRef.child("users").onChildAdded.listen((DatabaseEvent event) {
      final json = event.snapshot.value as Map<dynamic, dynamic>;
      _users.add(User.fromJson(event.snapshot, json));
    });
  }

  User? getUserById(String userId) {
    return _users.firstWhereOrNull((user) => user.uid == userId);
  }
}
