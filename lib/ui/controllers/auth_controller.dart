import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class AuthController extends GetxController with UiLoggy {
  final logged = true.obs;

  bool get isLogged => logged.value;

  Future<void> login(String email, String password) async {
    loggy.info("email: $email, password: $password");
    await Future.delayed(const Duration(seconds: 2));
    logged.value = true;
  }

  Future<void> loginWithGoogle() async {
    loggy.info("loginWithGoogle");
    await Future.delayed(const Duration(seconds: 2));
    logged.value = true;
  }

  Future<void> singUp(String name, String email, String password) async {
    loggy.info("email: $email, password: $password");
    await Future.delayed(const Duration(seconds: 2));
    logged.value = true;
  }

  Future<void> singUpWithGoogle() async {
    loggy.info("singUpWithGoogle");
    await Future.delayed(const Duration(seconds: 2));
    logged.value = true;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    logged.value = false;
  }
}
