import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/auth/signup_controller.dart';
import 'package:qcmapp/core/functions/validtextformfield/validinput.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/auth/customtetxformfield.dart';
import 'package:qcmapp/view/widgets/auth/customtextbutton.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    return Scaffold(
      body: GetBuilder<SignUpControllerImp>(builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            controller.goToSignIn();
            return Future.value(true);
          },
          child: SafeArea(
            child: Form(
              key: controller.formState,
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                children: [
                  Image.asset(
                    "assets/images/img2.png",
                    width: 150,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Sign Up", style: Theme.of(context).textTheme.headline2),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    validator: (p0) {
                      return validInput(p0!, 8, 30, "email");
                    },
                    icon: Icon(
                      Icons.alternate_email,
                      color: Colors.grey[700],
                    ),
                    labelText: "Email",
                    hintText: "Email",
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (p0) {
                      return validInput(p0!, 6, 20, "text");
                    },
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.grey[700],
                    ),
                    labelText: "Full name",
                    hintText: "Full name",
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (p0) => validInput(p0!, 6, 20, "phone"),
                    icon: Icon(
                      Icons.phone_outlined,
                      color: Colors.grey[700],
                    ),
                    labelText: "Mobile",
                    hintText: "Mobile",
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (p0) => validInput(p0!, 6, 20, "password"),
                    icon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey[700],
                    ),
                    labelText: "Password",
                    hintText: "Password",
                    suffixIcon: controller.suffixIconPassword,
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "By signing up, you're agree to our ",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              "Terms & Conditions",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "and ",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            CustomTextButton(
                              text: "Privacy Policy",
                              onTap: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonAuth(
                    text: "Continue",
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Joined us before ? ",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      CustomTextButton(
                        onTap: (() {
                          controller.goToSignIn();
                        }),
                        text: "Login",
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
