import 'package:flutter_test/flutter_test.dart';

void main() {
  group("LoginPage test", () {
    test("WHEN user click 'singup' THEN go to singupPage", () => null);

    test(
      "GIVEN a wrong email, WHEN user trys to login THEN show an error",
      () => null,
    );
    test(
      "GIVEN a weak password, WHEN user trys to login THEN show an error",
      () => null,
    );

    test(
      "GIVEN a wrong email and weak password, WHEN user trys to login THEN show TWO errors",
      () => null,
    );
    test(
      "GIVEN a valid email and password, WHEN user trys to login THEN login",
      () => null,
    );
  });

  group("SingupPage test", () {
    test("WHEN user click 'login' THEN go to loginPage", () => null);

    test(
      "GIVEN a wrong email, WHEN user trys to login THEN show an error",
      () => null,
    );
    test(
      "GIVEN a weak password, WHEN user trys to login THEN show an error",
      () => null,
    );

    test(
      "GIVEN a wrong email and weak password, WHEN user trys to login THEN show TWO errors",
      () => null,
    );
    test(
      "GIVEN a valid email and password, WHEN user trys to login THEN singup AND login",
      () => null,
    );
  });
}
