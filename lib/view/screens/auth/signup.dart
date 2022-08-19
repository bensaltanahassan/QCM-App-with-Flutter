import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/auth/signup_controller.dart';
import 'package:qcmapp/core/classes/handlingdataview.dart';
import 'package:qcmapp/core/functions/getdimension.dart';
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
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: Form(
                key: controller.formState,
                child: ListView(
                  padding: EdgeInsets.only(
                      left: getWith(20),
                      right: getWith(20),
                      bottom: getHeight(20)),
                  children: [
                    Image.asset("assets/images/img2.png",
                        width: getWith(150), height: getHeight(180)),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text("Sign Up",
                        style: Theme.of(context).textTheme.headline2),
                    SizedBox(height: getHeight(20)),
                    CustomTextFormField(
                      controller: controller.emailController,
                      validator: (p0) {
                        return validInput(p0!, 8, 50, "email");
                      },
                      icon: Icon(
                        Icons.alternate_email,
                        color: Colors.grey[700],
                      ),
                      labelText: "Email",
                      hintText: "Email",
                    ),
                    SizedBox(height: getHeight(10)),
                    CustomTextFormField(
                      controller: controller.nameController,
                      validator: (p0) {
                        return validInput(p0!, 6, 30, "text");
                      },
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.grey[700],
                      ),
                      labelText: "Full name",
                      hintText: "Full name",
                    ),
                    SizedBox(height: getHeight(10)),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      validator: (p0) => validInput(p0!, 6, 30, "password"),
                      icon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey[700],
                      ),
                      labelText: "Password",
                      hintText: "Password",
                      suffixIcon: controller.suffixIconPassword,
                      isPassword: controller.isPassword1,
                    ),
                    SizedBox(height: getHeight(15)),
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
                          SizedBox(height: getHeight(8)),
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
                    SizedBox(height: getHeight(10)),
                    CustomButtonAuth(
                      text: "Continue",
                      onPressed: () async {
                        controller.signUp();
                      },
                    ),
                    SizedBox(height: getHeight(20)),
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
          ),
        );
      }),
    );
  }
}
