import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController emailController;
  StatusRequest? statusRequest;
  Crud crud = Crud();

  @override
  goToVerifyCode() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await crud.postData(AppLinks.forgetpassword, {
        "email": emailController.text,
      }).then((value) => value.fold((l) => l, (r) => r));
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.sucess) {
        if (response is Map) {
          if (response["status"] == "success") {
            Get.toNamed(AppRoutes.verifycoderesetpassword,
                parameters: {"email": emailController.text});
          } else {
            Get.snackbar(
              "Email",
              "Email not found",
              duration: const Duration(seconds: 2),
              animationDuration: const Duration(seconds: 1),
              backgroundColor: Colors.blue[200],
            );
          }
        }
      }
    } else {}
    update();
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
