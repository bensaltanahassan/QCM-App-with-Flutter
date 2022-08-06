import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/services/services.dart';
import 'package:qcmapp/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController = PageController();
  int currentPage = 0;
  late String? textOfButton = "Continue";

  MyServices myServices = Get.find();

  @override
  void next() {
    if (currentPage < onBoardingList.length - 1) {
      currentPage++;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
      textOfButton = "Continue";

      update();
    } else {
      myServices.sharedPreferences.setString("onboarding", "1");
      textOfButton = "Get Started";

      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  void onPageChanged(int index) {
    currentPage = index;
    if (currentPage == onBoardingList.length - 1) {
      textOfButton = "Get Started";
    } else {
      textOfButton = "Continue";
    }
    update();
  }
}
