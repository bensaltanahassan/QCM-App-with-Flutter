import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  resendCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? verifyCode;
  Crud crud = Crud();
  StatusRequest? statusRequest;

  String? email = "";

  @override
  checkCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await crud.postData(AppLinks.verifycode, {
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
          Get.offAllNamed(AppRoutes.successSignUp, arguments: {"email": email});
        }
      }
    }
    statusRequest = StatusRequest.sucess;
    update();
  }

  @override
  resendCode() {}

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
