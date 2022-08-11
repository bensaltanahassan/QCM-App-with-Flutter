import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/home/schools_controller.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/data/datasource/exemples/staticdata.dart';
import 'package:qcmapp/view/widgets/categories/customcard.dart';

class ChooseSchool extends StatelessWidget {
  const ChooseSchool({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ChooseSchoolImp controller = Get.put(ChooseSchoolImp());

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 90,
                color: Colors.blue.shade100,
              ),
              Positioned(
                left: Get.width / 2 - 45,
                bottom: -45,
                child: Image.asset(
                  controller.avatar!,
                  width: 90,
                  height: 90,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            "Choose School",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          Expanded(
            child: SizedBox(
              width: 300,
              child: ListView.separated(
                itemCount: schoolsList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 40,
                  );
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
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
