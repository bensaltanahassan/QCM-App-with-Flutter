import 'dart:io';

import 'package:get/get.dart';
import 'package:qcmapp/controller/home/question_controller.dart';
import 'package:qcmapp/core/constant/routes.dart';

class ScoreController extends GetxController {
  int score = QuestionController().score;
  goToHome() {
    Get.offNamed(AppRoutes.home);
  }

  repeat() {
    Get.offNamed(AppRoutes.choosecategorie);
  }

  exitApp() {
    exit(0);
  }

  @override
  void dispose() {
    score = 0;
    super.dispose();
  }
}
