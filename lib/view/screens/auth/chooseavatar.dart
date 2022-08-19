import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/auth/chooseavatar_controller.dart';
import 'package:qcmapp/core/classes/handlingdataview.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/functions/getdimension.dart';

import 'package:qcmapp/data/datasource/exemples/avatar.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChooseAvatarController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GetBuilder<ChooseAvatarController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getHeight(70)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: getWith(20)),
                  padding: EdgeInsets.only(top: getHeight(10)),
                  width: double.infinity,
                  height: getHeight(500),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.blue),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: getHeight(30)),
                      Text("Choose Avatar",
                          style: TextStyle(
                              color: Colors.green[900], fontSize: 28)),
                      SizedBox(height: getHeight(50)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Spacer(),
                          ...List.generate(
                            AppAvatar.avatars.length,
                            (int index) => Container(
                              color: controller.indexAvatar == index
                                  ? Colors.blue
                                  : null,
                              margin:
                                  EdgeInsets.symmetric(horizontal: getWith(10)),
                              child: InkWell(
                                onTap: () {
                                  controller.indexAvatar = index;
                                  controller.update();
                                  controller.avatar = AppAvatar.avatars[index];
                                },
                                child: Image.asset(
                                  AppAvatar.avatars[index],
                                  width: getWith(60),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButtonAuth(
                  onPressed: () {
                    controller.updateAvatar();
                  },
                  text: "Continue",
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
