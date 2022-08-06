import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qcmapp/view/widgets/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/custombuttonsignwith.dart';
import 'package:qcmapp/view/widgets/customtetxformfield.dart';
import 'package:qcmapp/view/widgets/dividerwithtext.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            children: [
              Image.asset(
                "assets/images/img1.png",
                width: 150,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                icon: Icon(Icons.alternate_email),
                labelText: "Enter Your Email",
                hintText: "Email",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                icon: Icon(Icons.lock_outline),
                labelText: "Enter Your Password",
                hintText: "Password",
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Forget Password ?",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomButtonAuth(
                text: "Login",
              ),
              const SizedBox(
                height: 20,
              ),
              const DividerWithText(),
              const SizedBox(
                height: 20,
              ),
              CustomButtonSignWith(
                icon: BrandLogo(BrandLogos.google, size: 25),
                text: "Login with Google",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New To Logistics ? ",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
