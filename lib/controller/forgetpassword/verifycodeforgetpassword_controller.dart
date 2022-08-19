import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeForgetPasswordController extends GetxController {
  checkCode();
  goToResetPassword();
  resendCode();
  getInfoUser();
}

class VerifyCodeForgetPasswordControllerImp
    extends VerifyCodeForgetPasswordController {
  late String verifyCode;
  StatusRequest? statusRequest;
  Crud crud = Crud();
  String? email = "";

  @override
  checkCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await crud.postData(AppLinks.verifycodepassword, {
      "email": email,
      "verifycode": verifyCode,
    }).then((value) => value.fold((l) => l, (r) => r));
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.sucess) {
      if (response is Map) {
        if (response["status"] == "failure") {
          Get.snackbar(
            "Verification Code",
            "Verification code not correct",
            duration: const Duration(seconds: 2),
            animationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.blue[200],
          );
        } else {
          Get.offAllNamed(AppRoutes.resetPassword,
              parameters: {"email": email!});
        }
      }
    }
    statusRequest = StatusRequest.sucess;
    update();
  }

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword);
  }

  @override
  getInfoUser() async {
    statusRequest = StatusRequest.loading;
    var response = crud.postData(AppLinks.info, {
      "email": email,
    }).then((value) => value.fold((l) => l, (r) => r));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.sucess) {}
  }

  @override
  resendCode() {}
}
