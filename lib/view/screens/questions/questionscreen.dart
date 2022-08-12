import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:qcmapp/controller/home/question_controller.dart';
import 'package:qcmapp/core/constant/colors.dart';
import 'package:qcmapp/view/widgets/auth/custombuttonauth.dart';
import 'package:qcmapp/view/widgets/question/customcardanswer.dart';
import 'package:qcmapp/view/widgets/question/questiontext.dart';

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<QuestionController>(builder: (controler) {
          if (controler.loadingQuestions) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            controler.getCategory(0);
            return Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 10,
                  child: Text(
                    controler.category,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: AppColors.grey),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 30,
                  child: NeonCircularTimer(
                    width: 90,
                    textStyle: Theme.of(context).textTheme.headline1,
                    duration: 3600,
                    backgroudColor: Colors.blue[100],
                    innerFillColor: Colors.blue,
                    outerStrokeColor: Colors.white,
                    neonColor: Colors.white,
                    strokeWidth: 8,
                    isReverse: true,
                    onComplete: () {
                      controler.goToScorePage();
                    },
                    controller: controler.countDownController,
                  ),
                ),
                PageView.builder(
                  controller: controler.pageController,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int indexQst) {
                    controler.getQuestion(indexQst);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        children: [
                          //TODO
                          const SizedBox(height: 80),
                          Text.rich(
                            TextSpan(
                                text: "Question ${indexQst + 1}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 30),
                                children: const [
                                  TextSpan(
                                    text: "/10",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 20),
                                  )
                                ]),
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.black),
                          const SizedBox(height: 30),
                          Question(question: controler.question),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(children: [
                              ...List.generate(
                                  4,
                                  ((indexOpt) => Column(
                                        children: [
                                          CustomCardAnswer(
                                            questionId: indexQst,
                                            index: indexOpt,
                                            color: controler.allOptionsOfQst[
                                                        indexQst][indexOpt] ==
                                                    controler.selectedAnswers[
                                                        indexQst]
                                                ? Colors.red
                                                : Colors.blue,
                                            text: controler
                                                    .allOptionsOfQst[indexQst]
                                                [indexOpt],
                                            onTap: () {
                                              controler.selectedAnswers[
                                                  indexQst] = controler
                                                      .allOptionsOfQst[indexQst]
                                                  [indexOpt];
                                              controler.checkAnswer(
                                                  indexOpt, indexQst);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      )))
                            ]),
                          ),
                          indexQst == 9
                              ? CustomButtonAuth(
                                  text: "finish",
                                  textColor: Colors.blue,
                                  onPressed: () {
                                    controler.nextQuestion();
                                  },
                                  withButton: 150,
                                  color: Colors.white,
                                )
                              : const SizedBox()
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
