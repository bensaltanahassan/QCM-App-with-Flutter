import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';
import 'package:qcmapp/core/constant/links.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/functions/handlingdatacontroller.dart';

class ChooseAvatarController extends GetxController {
  String? email = "";
  StatusRequest? statusRequest;
  Crud crud = Get.find();
  int? indexAvatar;

  String? avatar;

  updateAvatar() async {
    if (avatar != "") {
      statusRequest = StatusRequest.loading;
      update();
      var response = await crud.postData(AppLinks.updateavatar, {
        "email": email,
        "avatar": avatar,
      }).then((value) => value.fold((l) => l, (r) => r));
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.sucess) {
        if (response is Map) {
          if (response["status"] == "success") {
            statusRequest = StatusRequest.sucess;
            Get.offAllNamed(AppRoutes.login);
          }
        }
      }
    } else {
      Get.defaultDialog(title: "Avatar", middleText: "Please choose avatar");
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
