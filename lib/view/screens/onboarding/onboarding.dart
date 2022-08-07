import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/onboarding/onboarding_controller.dart';
import 'package:qcmapp/view/widgets/onboarding/custombutton.dart';
import 'package:qcmapp/view/widgets/onboarding/customslideronboarding.dart';
import 'package:qcmapp/view/widgets/onboarding/dotcontroller.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                controller.skip();
              },
              child: const Text("Skip"))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: const [
                  Spacer(
                    flex: 1,
                  ),
                  CustomDotControllerOnBoarding(),
                  Spacer(
                    flex: 4,
                  ),
                  CustomButtonOnBoarding(),
                ],
              ))
        ],
      )),
    );
  }
}
