import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/onboarding/onboarding_controller.dart';
import 'package:qcmapp/core/functions/getdimension.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (context) {
      return Container(
        width: getWith(300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        margin: EdgeInsets.only(bottom: getHeight(30)),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: getWith(100)),
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
