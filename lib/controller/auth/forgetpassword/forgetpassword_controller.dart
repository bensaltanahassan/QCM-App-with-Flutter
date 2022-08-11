import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController emailController;

  @override
  goToVerifyCode() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.toNamed(AppRoutes.verifycode);
    } else {}
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
