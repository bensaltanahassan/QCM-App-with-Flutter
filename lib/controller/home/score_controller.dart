import 'dart:io';

import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';

class ScoreController extends GetxController {
  goToHome() {
    Get.offNamed(AppRoutes.home);
  }

  repeat() {
    Get.offNamed(AppRoutes.choosecategorie);
  }

  exitApp() {
    exit(0);
  }
}
