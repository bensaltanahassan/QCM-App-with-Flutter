import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:qcmapp/core/functions/getdimension.dart';
import 'package:qcmapp/core/functions/validtextformfield/validinput.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/auth/customtetxformfield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
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
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) {
          return SafeArea(
            child: Form(
              key: controller.formState,
              child: ListView(
                padding: EdgeInsets.only(
                    left: getWith(20),
                    right: getWith(20),
                    bottom: getHeight(20)),
                children: [
                  Image.asset(
                    "assets/images/img3.png",
                    width: getWith(150),
                    height: getHeight(220),
                  ),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  const Text(
                    "Forgot\nPassword ?",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: getHeight(30)),
                  Text(
                    "Don't worry! it happens. Please enter the \naddress associated with your account .",
                    style: TextStyle(
                        height: 1.5, color: Colors.grey[800], fontSize: 17),
                  ),
                  SizedBox(height: getHeight(20)),
                  CustomTextFormField(
                    controller: controller.emailController,
                    validator: (p0) => validInput(p0!, 8, 40, "email"),
                    icon: Icon(
                      Icons.alternate_email,
                      color: Colors.grey[700],
                    ),
                    labelText: "Email ID",
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: getHeight(40),
                  ),
                  CustomButtonAuth(
                    onPressed: () {
                      controller.goToVerifyCode();
                    },
                    text: "Submit",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
