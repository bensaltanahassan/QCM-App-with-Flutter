import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qcmapp/controller/auth/login_controller.dart';
import 'package:qcmapp/core/functions/validtextformfield/validinput.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonsignwith.dart';
import 'package:qcmapp/view/widgets/auth/customtetxformfield.dart';
import 'package:qcmapp/view/widgets/auth/customtextbutton.dart';
import 'package:qcmapp/view/widgets/auth/dividerwithtext.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => SafeArea(
          child: Form(
            key: controller.formState,
            child: ListView(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              children: [
                Image.asset(
                  "assets/images/img1.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  validator: (val) {
                    return validInput(val!, 5, 50, "email");
                  },
                  controller: controller.emailController,
                  icon: const Icon(Icons.alternate_email),
                  labelText: "Enter Your Email",
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  validator: (val) {
                    return validInput(val!, 8, 50, "password");
                  },
                  controller: controller.passwordController,
                  icon: const Icon(Icons.lock_outline),
                  labelText: "Enter Your Password",
                  hintText: "Password",
                  isPassword: controller.isPassword,
                  suffixIcon: IconButton(
                    icon: controller.suffixIcon!,
                    onPressed: () {
                      controller.changeObscurity();
                    },
                  ),
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
                      "New ? ",
                      style: Theme.of(context).textTheme.headline6,
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
        ),
      ),
    );
  }
}
