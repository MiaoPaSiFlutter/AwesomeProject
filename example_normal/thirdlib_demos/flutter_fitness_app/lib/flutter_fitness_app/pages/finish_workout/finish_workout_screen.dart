import 'package:flutter/material.dart';

import '../../compontents/compontents_index.dart';
import '../../tools/tools_index.dart';

class FinishWorkoutScreen extends StatelessWidget {
  static String routeName = "fitness_app/FinishWorkoutScreen";
  const FinishWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                Utils.assets("images/complete_workout.png"),
                height: media.width * 0.8,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Congratulations, You Have Finished Your Workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "-Jack Lalanne",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              RoundGradientButton(
                  title: "Back To Home",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
