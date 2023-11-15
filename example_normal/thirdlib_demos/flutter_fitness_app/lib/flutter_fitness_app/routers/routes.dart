import 'package:flutter/cupertino.dart';
import '../pages/activity_tracker/activity_tracker_screen.dart';
import '../pages/dashboard/dashboard_screen.dart';
import '../pages/finish_workout/finish_workout_screen.dart';
import '../pages/login/login_screen.dart';
import '../pages/notification/notification_screen.dart';
import '../pages/on_boarding/on_boarding_screen.dart';
import '../pages/on_boarding/start_screen.dart';
import '../pages/profile/complete_profile_screen.dart';
import '../pages/signup/signup_screen.dart';
import '../pages/welcome/welcome_screen.dart';
import '../pages/workout_schedule_view/workout_schedule_view.dart';
import '../pages/your_goal/your_goal_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  StartScreen.routeName: (context) => const StartScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  YourGoalScreen.routeName: (context) => const YourGoalScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  DashboardScreen.routeName: (context) => const DashboardScreen(),
  FinishWorkoutScreen.routeName: (context) => const FinishWorkoutScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  ActivityTrackerScreen.routeName: (context) => const ActivityTrackerScreen(),
  WorkoutScheduleView.routeName: (context) => const WorkoutScheduleView(),
};