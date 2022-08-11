import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';

abstract class VerifyCodeForgetPasswordController extends GetxController {
  checkCode();
  goToResetPassword();
  resendCode();
}

class VerifyCodeForgetPasswordControllerImp
    extends VerifyCodeForgetPasswordController {
  late String verifyCode;

  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword);
  }

  @override
  resendCode() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
