import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/onboarding/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (context) {
      return Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        margin: const EdgeInsets.only(bottom: 30),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          onPressed: () {
            controller.next();
          },
          textColor: Colors.white,
          child: Text(
            controller.textOfButton!,
            style: const TextStyle(),
          ),
        ),
      );
    });
  }
}
