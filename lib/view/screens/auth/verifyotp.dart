import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:qcmapp/view/widgets/custombuttonauth.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Icon(
          Icons.arrow_back_sharp,
          color: Colors.grey[700],
        ),
      ),
      body: SafeArea(
        child: Form(
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
                "An 5 digit code has been sent to\n+212682745447",
                style: TextStyle(
                    height: 1.5, color: Colors.grey[800], fontSize: 17),
              ),
              const SizedBox(height: 40),
              OtpTextField(
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
              const SizedBox(height: 40),
              const CustomButtonAuth(
                text: "Resend",
              ),
              const SizedBox(height: 10),
              const CustomButtonAuth(
                text: "Verify",
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
