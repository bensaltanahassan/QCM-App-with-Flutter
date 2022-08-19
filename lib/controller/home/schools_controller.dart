import 'package:get/get.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/services/services.dart';

abstract class ChooseSchoolController extends GetxController {
  goToCategories(String? school);
}

class ChooseSchoolControllerImp extends ChooseSchoolController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  String? avatar = "";

  @override
  goToCategories(String? school) {
    Get.toNamed(AppRoutes.choosecategorie);
  }

  getInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    avatar = myServices.sharedPreferences.getString("avatar");
    statusRequest = StatusRequest.sucess;

    update();
  }

  @override
  void onInit() async {
    await getInfo();
    print(avatar);
    super.onInit();
  }
}
