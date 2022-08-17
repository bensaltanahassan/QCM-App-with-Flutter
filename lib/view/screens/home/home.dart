import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/home/home_controller.dart';
import 'package:qcmapp/core/classes/handlingdataview.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/constant/imageassets.dart';
import 'package:qcmapp/core/functions/getdimension.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Center(
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
                          border: Border.all(width: 1, color: Colors.blue),
                        ),
                        child: Column(
                          children: [
                            Text(
                              controller.name!,
                              style: const TextStyle(
                                  // color: Colors.red,
                                  fontFamily: "Cairo",
                                  fontSize: 28,
                                  color: Colors.black),
                            ),
                            SizedBox(height: getHeight(100)),
                            CustomButtonAuth(
                              withButton: getWith(200),
                              text: "Commencer",
                              onPressed: () {
                                controller.goToSchools();
                              },
                            ),
                            SizedBox(height: getHeight(20)),
                            CustomButtonAuth(
                              withButton: getWith(200),
                              text: "About us",
                              onPressed: () {},
                            ),
                            SizedBox(height: getHeight(20)),
                            CustomButtonAuth(
                              withButton: getWith(200),
                              text: "Exit",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -45,
                        left: Get.width / 2 - getWith(45),
                        child: Image.asset(
                          controller.loginAsGuest == 0
                              ? "${AppImageAsset.rootImages}/${controller.avatar}.png"
                              : controller.avatar!,
                          width: getWith(90),
                          height: getWith(90),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
