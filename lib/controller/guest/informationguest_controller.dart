import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/services/services.dart';
import 'package:qcmapp/data/datasource/exemples/avatar.dart';

class InformationController extends GetxController {
  late TextEditingController nameController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Color? color;
  int? indexAvatar;

  MyServices myServices = Get.find();
  String? name;
  goToHomePage() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      if (indexAvatar == null) {
        Get.snackbar("Avatar", "Please choose avatar",
            duration: const Duration(seconds: 2),
            animationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.blue[200]);
      } else {
        await saveInformation();
        Get.offAllNamed(AppRoutes.home);
      }
    } else {}
  }

  saveInformation() {
    name = nameController.text;
    myServices.sharedPreferences.setString("login", "1");
    myServices.sharedPreferences.setString("name", "$name");
    myServices.sharedPreferences
        .setString("avatar", AppAvatar.avatars[indexAvatar!]);
  }

  changeColor(int index) {
    color = Colors.blue;
    update();
  }

  chooseAvatar(int indexAv) {
    indexAvatar = indexAv;
    update();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
