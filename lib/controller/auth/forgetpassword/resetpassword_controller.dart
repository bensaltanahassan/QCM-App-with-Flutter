import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';
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
  String? email;
  StatusRequest statusRequest = StatusRequest.loading;
  Crud crud = Crud();

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
  resetPassword() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      var response = await crud.postData(AppLinks.resetpassword, {
        "email": email,
        "newpassword": passwordController.text
      }).then((value) => value.fold((l) => l, (r) => r));
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response is Map) {
          if (response["status"] == "success") {
            Get.offAllNamed(AppRoutes.succesResetPassword);
          } else {
            Get.snackbar(
              "Password",
              "Please enter an different password than previous one",
              duration: const Duration(seconds: 2),
              animationDuration: const Duration(seconds: 1),
              backgroundColor: Colors.blue[200],
            );
          }
        }
      }
    } else {}
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
}
