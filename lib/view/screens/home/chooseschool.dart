import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/home/schools_controller.dart';
import 'package:qcmapp/core/classes/handlingdataview.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/core/functions/getdimension.dart';
import 'package:qcmapp/data/datasource/exemples/staticdata.dart';
import 'package:qcmapp/view/widgets/categories/customcard.dart';

class ChooseSchool extends StatelessWidget {
  const ChooseSchool({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ChooseSchoolControllerImp());

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: GetBuilder<ChooseSchoolControllerImp>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: getHeight(90),
                    color: Colors.blue.shade100,
                  ),
                  Positioned(
                    left: Get.width / 2 - getWith(45),
                    bottom: -45,
                    child: Image.asset(
                      controller.avatar!,
                      width: getWith(90),
                      height: getWith(90),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(70)),
              Text(
                "Choose School",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              Expanded(
                child: SizedBox(
                  width: getWith(300),
                  child: ListView.separated(
                    itemCount: schoolsList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: getHeight(40));
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCard(
                        title: "${schoolsList[index].title}",
                        image: "${schoolsList[index].image}",
                        onTap: () {
                          controller.goToCategories(schoolsList[index].title);
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: getHeight(10)),
            ],
          ),
        );
      }),
    );
  }
}
