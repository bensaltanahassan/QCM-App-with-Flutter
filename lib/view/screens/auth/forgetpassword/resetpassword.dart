import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:qcmapp/core/functions/getdimension.dart';
import 'package:qcmapp/core/functions/validtextformfield/notsamepassword.dart';
import 'package:qcmapp/core/functions/validtextformfield/validinput.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/auth/customtetxformfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //TODO
    String? email = Get.parameters["email"];
    Get.put(ResetPasswordControllerImp());

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
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) {
        controller.email = Get.parameters["email"];
        return SafeArea(
          child: Form(
            key: controller.formState,
            child: ListView(
              padding: EdgeInsets.only(
                  left: getWith(20), right: getWith(20), bottom: getHeight(20)),
              children: [
                Image.asset(
                  "assets/images/img5.png",
                  width: getWith(150),
                  height: getHeight(220),
                ),
                SizedBox(height: getHeight(20)),
                const Text(
                  "Reset\nPassword",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: getHeight(20)),
                CustomTextFormField(
                  controller: controller.passwordController,
                  icon: const Icon(Icons.lock_outline),
                  labelText: "New Password",
                  hintText: "New Password",
                  suffixIcon: IconButton(
                    icon: controller.suffixIconPassword!,
                    onPressed: () {
                      controller.changeObscurityPassword();
                    },
                  ),
                  validator: (text) {
                    return validInput(text!, 8, 20, "password");
                  },
                  isPassword: controller.isPassword1,
                ),
                SizedBox(height: getHeight(20)),
                CustomTextFormField(
                  icon: const Icon(Icons.lock_outline),
                  labelText: "Confirm new password",
                  hintText: "Confirm new password",
                  validator: (text) {
                    return noteSamePasswords(controller.passwordController.text,
                        controller.confirmPasswordController.text);
                  },
                  controller: controller.confirmPasswordController,
                  suffixIcon: IconButton(
                    icon: controller.suffixIconConfirmPassword!,
                    onPressed: () {
                      controller.changeObscurityConfirmPassword();
                    },
                  ),
                  isPassword: controller.isPassword2,
                ),
                SizedBox(height: getHeight(40)),
                CustomButtonAuth(
                  onPressed: () {
                    controller.resetPassword();
                  },
                  text: "Submit",
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
