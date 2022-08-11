import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/services/services.dart';

abstract class HomeController extends GetxController {
  goToSchools();
  goToAboutUs();
  exitApp();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? name;
  String? avatar;

  @override
  exitApp() {}

  @override
  goToAboutUs() {}

  @override
  goToSchools() {
    Get.toNamed(AppRoutes.chooseschool);
  }

  @override
  void onInit() {
    name = myServices.sharedPreferences.getString("name");
    avatar = myServices.sharedPreferences.getString("avatar");
    super.onInit();
  }
}
