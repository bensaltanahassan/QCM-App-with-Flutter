import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qcmapp/core/constant/imageassets.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.asset(AppImageAsset.success, height: 300, width: 300),
            const SizedBox(
              height: 100,
            ),
            Text("Sign Up with success",
                style: Theme.of(context).textTheme.headline2),
            Text("Welcome To QCM App",
                style: Theme.of(context).textTheme.headline4),
            const Spacer(),
            CustomButtonAuth(
              onPressed: () {
                Get.offAllNamed(AppRoutes.login);
              },
              text: "Continue",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
