import 'package:flutter/material.dart';
import 'package:qcmapp/view/widgets/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/customtetxformfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

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
                "assets/images/img5.png",
                width: 150,
                height: 220,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Reset\nPassword",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                icon: Icon(Icons.lock_outline),
                labelText: "New Password",
                hintText: "New Password",
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                icon: Icon(Icons.lock_outline),
                labelText: "Confirm new password",
                hintText: "Confirm new password",
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomButtonAuth(
                text: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
