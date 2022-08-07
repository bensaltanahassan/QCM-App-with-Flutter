import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
  goToSignUp();
  changeObscurity();
  onChangeText();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;

  bool isPassword = true;
  late Widget? suffixIcon; //for password show/hidden

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
    Get.offNamed(AppRoutes.forgetPassword);
  }

  @override
  changeObscurity() {
    isPassword = !isPassword;
    suffixIcon = isPassword == true
        ? const Icon(Icons.remove_red_eye_outlined)
        : const Icon(Icons.remove_red_eye_rounded);

    update();
  }

  @override
  onChangeText() {
    if (passwordController.text.isEmpty) {
      suffixIcon = const Icon(Icons.lock_outline);
    } else {
      if (isPassword == true) {
        suffixIcon = const Icon(Icons.remove_red_eye_outlined);
      } else {
        suffixIcon = const Icon(Icons.remove_red_eye_rounded);
      }
    }
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();
    suffixIcon = const Icon(Icons.lock_outline);
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
