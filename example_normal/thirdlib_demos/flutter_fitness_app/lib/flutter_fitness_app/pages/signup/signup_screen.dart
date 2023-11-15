import 'package:flutter/material.dart';

import '../../compontents/compontents_index.dart';
import '../../tools/tools_index.dart';
import '../profile/complete_profile_screen.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = "fitness_app/SignupScreen";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Hey there,",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Create an Account",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  hintText: "First Name",
                  icon: Utils.assets("icons/profile_icon.png"),
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                    hintText: "Last Name",
                    icon: Utils.assets("icons/profile_icon.png"),
                    textInputType: TextInputType.name),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                    hintText: "Email",
                    icon: Utils.assets("icons/message_icon.png"),
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  hintText: "Password",
                  icon: Utils.assets("icons/lock_icon.png"),
                  textInputType: TextInputType.text,
                  isObscureText: true,
                  rightIcon: TextButton(
                      onPressed: () {},
                      child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            Utils.assets("icons/hide_pwd_icon.png"),
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: AppColors.grayColor,
                          ))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        icon: Icon(
                          isCheck
                              ? Icons.check_box_outline_blank_outlined
                              : Icons.check_box_outlined,
                          color: AppColors.grayColor,
                        )),
                    const Expanded(
                      child: Text(
                          "By continuing you accept our Privacy Policy and\nTerm of Use",
                          style: TextStyle(
                            color: AppColors.grayColor,
                            fontSize: 10,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundGradientButton(
                  title: "Register",
                  onPressed: () {
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.routeName);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.maxFinite,
                      height: 1,
                      color: AppColors.grayColor.withOpacity(0.5),
                    )),
                    const Text("  Or  ",
                        style: TextStyle(
                            color: AppColors.grayColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Expanded(
                        child: Container(
                      width: double.maxFinite,
                      height: 1,
                      color: AppColors.grayColor.withOpacity(0.5),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.primaryColor1.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          Utils.assets("icons/google_icon.png"),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.primaryColor1.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          Utils.assets("icons/facebook_icon.png"),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                            ),
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    color: AppColors.secondaryColor1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800)),
                          ]),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
