import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qcmapp/controller/home/score_controller.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/constant/imageassets.dart';
import 'package:qcmapp/core/functions/getdimension.dart';

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
                      margin: EdgeInsets.symmetric(horizontal: getWith(20)),
                      padding: EdgeInsets.only(top: getHeight(70)),
                      width: double.infinity,
                      height: getHeight(500),
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
                                width: getWith(90),
                                height: getWith(90),
                              ),
                              Text(
                                "Your Score : ${Get.parameters["score"]}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 35),
                              )
                            ],
                          ),
                          SizedBox(height: getHeight(130)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: getWith(10)),
                              InkWell(
                                child: Image.asset(AppImageAsset.home,
                                    width: getWith(70)),
                                onTap: () {
                                  controller.goToHome();
                                },
                              ),
                              InkWell(
                                child: Image.asset(AppImageAsset.repeat,
                                    width: getWith(70)),
                                onTap: () {
                                  controller.repeat();
                                },
                              ),
                              InkWell(
                                child: Image.asset(AppImageAsset.logout,
                                    width: getWith(70)),
                                onTap: () {
                                  controller.exitApp();
                                },
                              ),
                              SizedBox(width: getHeight(10)),
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
