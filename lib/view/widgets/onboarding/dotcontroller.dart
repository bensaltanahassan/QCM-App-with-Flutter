import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/onboarding/onboarding_controller.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) {
              return AnimatedContainer(
                margin: const EdgeInsets.only(right: 5),
                duration: const Duration(milliseconds: 600),
                width: controller.currentPage == index ? 20 : 5,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
