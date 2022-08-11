import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/controller/home/categories_controller.dart';
import 'package:qcmapp/data/datasource/exemples/staticdata.dart';
import 'package:qcmapp/view/widgets/categories/customcard.dart';

class ChooseCategorie extends StatelessWidget {
  const ChooseCategorie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChooseCategorieControllerImp controller =
        Get.put(ChooseCategorieControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 90,
                color: Colors.blue[100],
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
            "Choose Categorie",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          Expanded(
            child: SizedBox(
              width: 300,
              child: ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 40,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(
                    onTap: () {
                      controller.goToQuestions("ENSA");
                    },
                    title: "${categories[index].name}",
                    image: categories[index].image!,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
