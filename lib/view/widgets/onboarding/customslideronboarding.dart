import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/onboarding/onboarding_controller.dart';
import 'package:qcmapp/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {
        controller.onPageChanged(index);
      },
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              onBoardingList[index].image!,
              width: 250,
              height: 260,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            onBoardingList[index].title!,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            onBoardingList[index].body!,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
