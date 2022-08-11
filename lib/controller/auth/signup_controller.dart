import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:unicons/unicons.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  changeObscurityPassword();
  changeObscurityConfirmPassword();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  late TextEditingController confirmPasswordController;

  bool isPassword1 = true;
  late Widget? suffixIconPassword;

  bool isPassword2 = true;
  late Widget? suffixIconConfirmPassword;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  signUp() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.toNamed(AppRoutes.verifycodeSignUp);
      // deleting memory // delete information of sign up
      // Get.delete<SignUpControllerImp>();
      // or using lazyput
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  changeObscurityPassword() {
    isPassword1 = !isPassword1;
    suffixIconPassword = isPassword1 == false
        ? const Icon(UniconsLine.eye)
        : const Icon(UniconsLine.eye_slash);

    update();
  }

  @override
  changeObscurityConfirmPassword() {
    isPassword2 = !isPassword2;
    suffixIconConfirmPassword = isPassword2 == false
        ? const Icon(UniconsLine.eye)
        : const Icon(UniconsLine.eye_slash);

    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();

    suffixIconPassword = const Icon(UniconsLine.eye_slash);
    suffixIconConfirmPassword = const Icon(UniconsLine.eye_slash);

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    phoneController.dispose();

    super.dispose();
  }
}
