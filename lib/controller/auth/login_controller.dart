import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:unicons/unicons.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
  goToSignUp();
  changeObscurity();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPassword = true;
  late Widget? suffixIcon;

  @override
  login() {
    var formData = formState.currentState;
    if (formData!.validate()) {
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  changeObscurity() {
    isPassword = !isPassword;
    suffixIcon = isPassword == false
        ? const Icon(UniconsLine.eye)
        : const Icon(UniconsLine.eye_slash);

    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    suffixIcon = const Icon(UniconsLine.eye_slash);
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
