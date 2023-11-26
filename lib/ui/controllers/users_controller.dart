import 'package:get/get.dart';
import '../../data/model/user.dart';
import 'package:firebase_database/firebase_database.dart';

class UsersController extends GetxController {
  var _users = <User>[].obs; 
  final databaseRef = FirebaseDatabase.instance.ref();

  List<User> get users => _users.toList();

  @override
  void onInit() {
    super.onInit();
    _loadUsers();
  }

  void _loadUsers() {
    databaseRef.child("users").onChildAdded.listen((DatabaseEvent event) {
      final json = event.snapshot.value as Map<dynamic, dynamic>;
      _users.add(User.fromJson(event.snapshot, json));
    });
  }

  User? getUserById(String userId) {
    return _users.firstWhereOrNull((user) => user.uid == userId);
  }

}

