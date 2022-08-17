import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qcmapp/core/constant/imageassets.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/getdimension.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: getHeight(20)),
            Lottie.asset(AppImageAsset.success,
                height: getHeight(300), width: getWith(300)),
            SizedBox(height: getHeight(100)),
            Text("Reset Password with success",
                style: Theme.of(context).textTheme.headline2),
            Text("Please Log In to continue",
                style: Theme.of(context).textTheme.headline4),
            const Spacer(),
            CustomButtonAuth(
              onPressed: () {
                Get.offAllNamed(AppRoutes.login);
              },
              text: "Continue",
            ),
            SizedBox(height: getHeight(20)),
          ],
        ),
      ),
    );
  }
}
