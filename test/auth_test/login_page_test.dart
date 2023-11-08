import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/pages/authentication/singup_page.dart';
import 'package:sportlingo/ui/pages/content/home_page.dart';

void main() {
  group("LoginPage test", () {
    testWidgets("Form elements", (WidgetTester tester) async {
      Get.put(AuthController());

      await tester.pumpWidget(GetMaterialApp(
        home: LoginPage(),
      ));

      expect(find.byKey(const Key("loginPage")), findsOneWidget);
      expect(find.byKey(const Key("loginPageEmailField")), findsOneWidget);
      expect(find.byKey(const Key("loginPagePasswordField")), findsOneWidget);
      expect(find.byKey(const Key("loginPageLoginButton")), findsOneWidget);
      expect(find.byKey(const Key("loginPageLoginWithGoogleButton")),
          findsOneWidget);
      expect(find.byKey(const Key("loginPageSingupButton")), findsOneWidget);
    });

    testWidgets("WHEN user click 'singup' THEN go to singupPage",
        (WidgetTester tester) async {
      Get.put(AuthController());

      await tester.pumpWidget(GetMaterialApp(
        home: LoginPage(),
      ));
      await tester.tap(find.byKey(const Key("loginPageSingupButton")));
      await tester.pumpAndSettle();
      expect(find.byType(SingupPage), findsOneWidget);
    });

    testWidgets(
      "GIVEN a wrong email, WHEN user trys to login THEN show an error",
      (WidgetTester tester) async {
        Get.put(AuthController());

        await tester.pumpWidget(GetMaterialApp(
          home: LoginPage(),
        ));

        await tester.enterText(find.byKey(const Key("loginPageEmailField")),
            "this is a wrong email");

        await tester.enterText(find.byKey(const Key("loginPagePasswordField")),
            "thispasswordisokay123");

        await tester.tap(find.byKey(const Key("loginPageLoginButton")));

        await tester.pumpAndSettle();

        expect(find.text("Please enter a valid email"), findsOneWidget);
      },
    );
    testWidgets(
      "GIVEN a weak password, WHEN user trys to login THEN show an error",
      (WidgetTester tester) async {
        Get.put(AuthController());

        await tester.pumpWidget(GetMaterialApp(
          home: LoginPage(),
        ));

        await tester.enterText(
            find.byKey(const Key("loginPageEmailField")), "email@domain.tld");

        await tester.enterText(find.byKey(const Key("loginPagePasswordField")),
            "123"); // this password is too short

        await tester.tap(find.byKey(const Key("loginPageLoginButton")));

        await tester.pumpAndSettle();

        expect(find.text("Password must be at least 6 characters long"),
            findsOneWidget);
      },
    );

    testWidgets(
      "GIVEN a wrong email and weak password, WHEN user trys to login THEN show TWO errors",
      (WidgetTester tester) async {
        Get.put(AuthController());

        await tester.pumpWidget(GetMaterialApp(
          home: LoginPage(),
        ));

        await tester.enterText(find.byKey(const Key("loginPageEmailField")),
            "this is a wrong email");

        await tester.enterText(find.byKey(const Key("loginPagePasswordField")),
            "123"); // this password is too short

        await tester.tap(find.byKey(const Key("loginPageLoginButton")));

        await tester.pumpAndSettle();

        expect(find.text("Please enter a valid email"), findsOneWidget);

        expect(find.text("Password must be at least 6 characters long"),
            findsOneWidget);
      },
    );
    testWidgets(
      "GIVEN a valid email and password, WHEN user trys to login THEN login",
      (WidgetTester tester) async {
        Get.put(AuthController());

        await tester.pumpWidget(GetMaterialApp(
          home: LoginPage(),
        ));

        await tester.enterText(
            find.byKey(const Key("loginPageEmailField")), "email@domain.tld");

        await tester.enterText(find.byKey(const Key("loginPagePasswordField")),
            "thispasswordisokay123");

        await tester.tap(find.byKey(const Key("loginPageLoginButton")));

        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byType(HomePage), findsOneWidget);
      },
    );
  });
}
