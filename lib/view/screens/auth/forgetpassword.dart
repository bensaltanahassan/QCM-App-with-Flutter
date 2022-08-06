import 'package:flutter/material.dart';
import 'package:qcmapp/view/widgets/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/customtetxformfield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

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
                "assets/images/img3.png",
                width: 150,
                height: 220,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Forgot\nPassword ?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Text(
                "Don't worry! it happens. Please enter the \naddress associated with your account .",
                style: TextStyle(
                    height: 1.5, color: Colors.grey[800], fontSize: 17),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.grey[700],
                ),
                labelText: "Email ID / Mobile number",
                hintText: "Email",
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
