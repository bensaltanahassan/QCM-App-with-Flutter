import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/welcome/welcomecontroller.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/constant/imageassets.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';

class Welcome extends GetView<WelcomeControllerImp> {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WelcomeControllerImp controller = Get.put(WelcomeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            Text(
              "Share your latest knowledge with other people.\n Or answer the question they shared.",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButtonAuth(
              onPressed: () {
                controller.goToLogin();
              },
              text: "Sign In",
            ),
            const SizedBox(height: 15),
            CustomButtonAuth(
              onPressed: () {
                controller.goToSignUp();
              },
              text: "Sign Up",
            ),
            const SizedBox(height: 15),
            CustomButtonAuth(
              onPressed: () {
                controller.continueAsGuest();
              },
              text: "Continue as a guest",
              color: Colors.white,
              textColor: AppColors.blue,
            ),
            const SizedBox(height: 60),
            Image.asset(
              AppImageAsset.welcomeImage,
              height: 130,
            )
          ],
        ),
      ),
    );
  }
}
