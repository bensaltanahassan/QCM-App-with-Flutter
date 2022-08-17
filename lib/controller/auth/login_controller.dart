import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';
import 'package:qcmapp/core/services/services.dart';
import 'package:unicons/unicons.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
  goToSignUp();
  changeObscurity();
  chekIfApproved(String email);
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPassword = true;
  late Widget? suffixIcon;
  late StatusRequest statusRequest;
  Crud crud = Crud();
  List data = [];
  String? msgErr;

  @override
  login() async {
    statusRequest = StatusRequest.loading;
    var formData = formState.currentState;
    if (formData!.validate()) {
      var response = await crud.postData(AppLinks.login, {
        "email": emailController.text,
        "password": passwordController.text
      }).then((value) => value.fold((l) => l, (r) => r));

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response is Map) {
          if (response["status"] == "failure") {
            Get.snackbar(
              "Informations incorrect",
              "Email or password incorrect",
              duration: const Duration(seconds: 2),
              animationDuration: const Duration(seconds: 1),
              backgroundColor: Colors.blue[200],
            );
          } else {
            bool isApproved = await chekIfApproved(emailController.text);
            if (isApproved) {
              myServices.sharedPreferences.setString("login", "1");
              myServices.sharedPreferences.setInt("loginasguest", 0);
              myServices.sharedPreferences
                  .setString("email", emailController.text);
              Get.offAllNamed(AppRoutes.home);
            } else {
              Get.defaultDialog(
                  title: "Email not verified",
                  middleText: "Do you want to verify it ?",
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.verifycodeSignUp,
                            parameters: {"email": emailController.text});
                      },
                      child: const Text("Verify Email"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel"),
                    ),
                  ]);
            }
          }
        }
      }
    } else {}
  }

  @override
  Future<bool> chekIfApproved(String email) async {
    var response = await crud.postData(AppLinks.info, {
      "email": email,
    }).then((value) {
      return value.fold((l) => l, (r) => r);
    });

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.sucess) {
      if (response is Map) {
        if (response["data"][0]["users_approve"] == "1") {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword, parameters: {
      "email": emailController.text,
    });
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
