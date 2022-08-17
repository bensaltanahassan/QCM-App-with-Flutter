import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';
import 'package:qcmapp/core/services/services.dart';

abstract class HomeController extends GetxController {
  goToSchools();
  goToAboutUs();
  exitApp();
  getInfoUser();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? name = "";
  String? avatar = "";
  String? email;
  late StatusRequest statusRequest;
  Crud crud = Crud();
  List data = [];
  int? loginAsGuest;

  @override
  exitApp() {}

  @override
  goToAboutUs() {}

  @override
  goToSchools() {
    Get.toNamed(AppRoutes.chooseschool);
  }

  @override
  getInfoUser() async {
    statusRequest = StatusRequest.loading;
    loginAsGuest = myServices.sharedPreferences.getInt("loginasguest");
    if (loginAsGuest == 0) {
      email = myServices.sharedPreferences.getString("email");
      var response = await crud.postData(AppLinks.info, {
        "email": email,
      }).then((value) => value.fold((l) => l, (r) => r));

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response is Map) {
          data.addAll(response["data"]);
          name = data[0]["users_name"];
          avatar = "${data[0]["users_avatar"]}.png";
        }
      }
    }
    if (loginAsGuest == 1) {
      name = myServices.sharedPreferences.getString("name");
      avatar = myServices.sharedPreferences.getString("avatar");
    }
    statusRequest = StatusRequest.sucess;
    update();
  }

  @override
  void onInit() async {
    await getInfoUser();
    super.onInit();
  }
}
