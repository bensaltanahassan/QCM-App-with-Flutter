import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/services/services.dart';

abstract class ChooseCategorieController extends GetxController {
  goToQuestions(String? school);
}

class ChooseCategorieControllerImp extends ChooseCategorieController {
  MyServices myServices = Get.find();
  String? avatar;

  List questions = [];
  bool loadingQuestions = true;

  @override
  goToQuestions(String? school) {
    Get.toNamed(AppRoutes.question);
  }

  @override
  void onInit() {
    avatar = myServices.sharedPreferences.getString("avatar");
    super.onInit();
  }
}
