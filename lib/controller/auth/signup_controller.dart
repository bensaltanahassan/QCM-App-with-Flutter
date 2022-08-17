import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';
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
  late TextEditingController nameController;
  late TextEditingController confirmPasswordController;
  Crud crud = Crud();
  late StatusRequest statusRequest;
  bool isPassword1 = true;
  late Widget? suffixIconPassword;

  bool isPassword2 = true;
  late Widget? suffixIconConfirmPassword;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await crud.postData(AppLinks.signup, {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      }).then((value) {
        print(value);
        return value.fold((l) => l, (r) => r);
      });
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response is Map) {
          if (response["status"] == "success") {
            Get.toNamed(AppRoutes.verifycodeSignUp,
                parameters: {"email": emailController.text});
          } else {
            Get.snackbar(
              "Email",
              "Email deja utilisé",
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
    nameController = TextEditingController();

    suffixIconPassword = const Icon(UniconsLine.eye_slash);
    suffixIconConfirmPassword = const Icon(UniconsLine.eye_slash);

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();

    super.dispose();
  }
}
