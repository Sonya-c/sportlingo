import 'package:get/get.dart';

class AuthController extends GetxController {
  final logged = false.obs;

  bool get isLogged => logged.value;

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    logged.value = true;
  }

  Future<void> singUp(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    logged.value = true;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    logged.value = false;
  }
}
