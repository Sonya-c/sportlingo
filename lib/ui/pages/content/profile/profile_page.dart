import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final userController = Get.find<UserController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final distanceGoalController = TextEditingController(
      text: userController.currentGoalDistance.toString(),
    );
    final timeHoursGoalController = TextEditingController(
      text: userController.currentGoalTime.inHours.toString(),
    );
    final timeMinutesGoalController = TextEditingController(
      text: userController.currentGoalTime.inMinutes.toString(),
    );

    InputDecoration decoration = InputDecoration(
      filled: true,
      fillColor: const Color.fromARGB(255, 223, 223, 223),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Obx(
      () => ScrollLayout(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        children: [
          const SizedBox(height: 15),
          Text(
            userController.currentUser.name,
            style: blackOpsOne['2xl'],
          ),
          Text(
            "@${userController.currentUser.username}",
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 50),
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daily Goals!",
                    style: blackOpsOne['l'],
                  ),
                  Text("Distance", style: blackOpsOne['m']),
                  TextFormField(
                    decoration: decoration,
                    keyboardType: TextInputType.number,
                    controller: distanceGoalController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a distance';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("Time"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: decoration,
                          controller: timeHoursGoalController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter hours';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        child: Text(":",
                            textAlign: TextAlign.center,
                            style: blackOpsOne['xl']),
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: decoration,
                          controller: timeMinutesGoalController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter minutes';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = _formKey.currentState;

                      form!.save();

                      if (form.validate()) {
                        await userController.changeGoals(
                          double.parse(distanceGoalController.text),
                          Duration(
                            hours: int.parse(timeHoursGoalController.text),
                            minutes: int.parse(timeMinutesGoalController.text),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text("Save"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
