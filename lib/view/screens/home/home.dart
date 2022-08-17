import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/home/home_controller.dart';
import 'package:qcmapp/core/classes/handlingdataview.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/constant/imageassets.dart';
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
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.only(top: 70),
                        width: double.infinity,
                        height: 500,
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
                            const SizedBox(height: 100),
                            CustomButtonAuth(
                              withButton: 200,
                              text: "Commencer",
                              onPressed: () {
                                controller.goToSchools();
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomButtonAuth(
                              withButton: 200,
                              text: "About us",
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            CustomButtonAuth(
                              withButton: 200,
                              text: "Exit",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -45,
                        left: Get.width / 2 - 45,
                        child: Image.asset(
                          "${AppImageAsset.rootImages}/${controller.avatar}.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
