import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qcmapp/controller/home/score_controller.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/constant/imageassets.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ScoreController());
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: GetBuilder<ScoreController>(
          builder: (controller) => Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.only(top: 70),
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                AppImageAsset.champion,
                                width: 90,
                                height: 90,
                              ),
                              Text(
                                "Your Score : ${Get.parameters["score"]}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 35),
                              )
                            ],
                          ),
                          const SizedBox(height: 130),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(width: 10),
                              InkWell(
                                child:
                                    Image.asset(AppImageAsset.home, width: 70),
                                onTap: () {
                                  controller.goToHome();
                                },
                              ),
                              InkWell(
                                child: Image.asset(AppImageAsset.repeat,
                                    width: 70),
                                onTap: () {
                                  controller.repeat();
                                },
                              ),
                              InkWell(
                                child: Image.asset(AppImageAsset.logout,
                                    width: 70),
                                onTap: () {
                                  controller.exitApp();
                                },
                              ),
                              const SizedBox(width: 10),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: -45,
                      left: Get.width / 2 - 45,
                      child: Image.asset(
                        AppImageAsset.avatar,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
