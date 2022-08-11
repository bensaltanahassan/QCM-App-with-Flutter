import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/services/services.dart';

abstract class ChooseSchoolController extends GetxController {
  goToCategories(String? school);
}

class ChooseSchoolImp extends ChooseSchoolController {
  MyServices myServices = Get.find();

  String? avatar;

  @override
  goToCategories(String? school) {
    Get.toNamed(AppRoutes.choosecategorie);
  }

  @override
  void onInit() {
    avatar = myServices.sharedPreferences.getString("avatar");

    super.onInit();
  }
}
