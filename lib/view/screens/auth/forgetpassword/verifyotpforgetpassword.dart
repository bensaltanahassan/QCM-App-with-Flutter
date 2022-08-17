import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/auth/forgetpassword/verifycodeforgetpassword_controller.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';

class VerifyOtpForgetPassword extends StatelessWidget {
  const VerifyOtpForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeForgetPasswordControllerImp controller =
        Get.put(VerifyCodeForgetPasswordControllerImp());
    controller.email = Get.parameters["email"];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: IconButton(
          onPressed: (() {
            Get.back();
          }),
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.grey[700],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          children: [
            Image.asset(
              "assets/images/img4.png",
              width: 150,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Enter OTP",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text(
              "An 5 digit code has been sent to\n${controller.email}",
              style:
                  TextStyle(height: 1.5, color: Colors.grey[800], fontSize: 17),
            ),
            const SizedBox(height: 40),
            OtpTextField(
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                controller.verifyCode = code;
              },
              onSubmit: (String verificationCode) {
                controller.verifyCode = verificationCode;
              }, // end onSubmit
            ),
            const SizedBox(height: 40),
            CustomButtonAuth(
              text: "Resend",
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            CustomButtonAuth(
              onPressed: () async {
                controller.checkCode();
              },
              text: "Verify",
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
