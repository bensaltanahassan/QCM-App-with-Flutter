import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';

abstract class WelcomeController extends GetxController {
  goToLogin();
  goToSignUp();
  continueAsGuest();
}

class WelcomeControllerImp extends WelcomeController {
  @override
  continueAsGuest() {
    Get.toNamed(AppRoutes.informationsguest);
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }
}
