import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/services/services.dart';

class OnBoardingMiddleWare extends GetMiddleware {
  @override
  int? get priority => 2;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoutes.welcome);
    }

    return null;
  }
}

class LoginMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("login") == "1") {
      return const RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}
