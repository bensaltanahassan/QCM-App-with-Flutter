import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qcmapp/controller/auth/logincontroller.dart';
import 'package:qcmapp/view/widgets/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/custombuttonsignwith.dart';
import 'package:qcmapp/view/widgets/customtetxformfield.dart';
import 'package:qcmapp/view/widgets/customtextbutton.dart';
import 'package:qcmapp/view/widgets/dividerwithtext.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(
          builder: (controller) => SafeArea(
                child: Form(
                  child: ListView(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: controller.emailController,
                        icon: const Icon(Icons.alternate_email),
                        labelText: "Enter Your Email",
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        controller: controller.passwordController,
                        icon: const Icon(Icons.lock_outline),
                        labelText: "Enter Your Password",
                        hintText: "Password",
                        suffixIcon: const Icon(Icons.remove_red_eye),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: CustomTextButton(
                          text: "Forget Password ?",
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.login();
                        },
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
                          CustomTextButton(
                            text: "Register",
                            onTap: () {
                              controller.goToSignUp();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
