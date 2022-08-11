import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:unicons/unicons.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSignIn();
  changeObscurityPassword();
  changeObscurityConfirmPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool isPassword1 = true;
  late Widget? suffixIconPassword;

  bool isPassword2 = true;
  late Widget? suffixIconConfirmPassword;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoutes.login);
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
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    suffixIconPassword = const Icon(UniconsLine.eye_slash);
    suffixIconConfirmPassword = const Icon(UniconsLine.eye_slash);

    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  resetPassword() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToSignIn();
    } else {}
  }
}
