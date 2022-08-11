import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/data/datasource/exemples/staticdata.dart';
import 'package:qcmapp/data/model/categorymodel.dart';
import 'package:http/http.dart' as http;

class QuestionController extends GetxController {
  // List<CategoryModel> categories = [
  //   CategoryModel(
  //     id: 18,
  //     difficulty: "easy",
  //   )
  // ];

  late CountDownController? countDownController;
  late PageController pageController;

  List request = [];
  List options = [];
  List allOptionsOfQst = [];
  List<String> selectedAnswers = [];
  List<int> scoresOfAnswers = [];
  String question = "";
  String correctAnswer = "";
  List<String> allCorrectAnswers = [];
  String category = "";
  int score = 0;
  int nbrOfQst = 10;
  bool loadingQuestions = true;

  loadQuestion(CategoryModel categoryModel) async {
    loadingQuestions = true;
    String link =
        "https://opentdb.com/api.php?amount=10&category=23&difficulty=easy&type=multiple";
    Uri url = Uri.parse(link);
    http.Response response = await http.get(url);
    var json = await jsonDecode(response.body);
    if (json["results"] != null) {
      json["results"].forEach((e) => request.add(e));
    }
    loadingQuestions = false;
    await getAllOptionsOfQuestion();
    update();
  }

  getQuestion(int indexQst) {
    question = request[indexQst]["question"];
  }

  getAllOptionsOfQuestion() {
    for (var indexQst = 0; indexQst < nbrOfQst; indexQst++) {
      getOptions(indexQst);
      allOptionsOfQst.add(options);
    }
  }

  getOptions(int indexQst) {
    options = [
      request[indexQst]["correct_answer"],
      ...request[indexQst]["incorrect_answers"]
    ];
    options.shuffle();
  }

  getCorrectAnswer(int indexQst) {
    correctAnswer = request[indexQst]["correct_answer"];
  }

  getAllCorrectAnswers() {
    for (var indexQst = 0; indexQst < nbrOfQst; indexQst++) {
      getCorrectAnswer(indexQst);
      allCorrectAnswers.add(correctAnswer);
    }
  }

  getCategory(int indexQst) {
    category = request[indexQst]["category"];
  }

  initialeAnswers() {
    for (var i = 0; i < nbrOfQst; i++) {
      selectedAnswers.add("");
    }
  }

  nextQuestion() {
    if (pageController.page == 9) {
      for (var element in scoresOfAnswers) {
        score += element;
      }
      goToScorePage();
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    update();
  }

  checkAnswer(int indexOption, int indexQst) {
    if (allOptionsOfQst[indexQst][indexOption] == allCorrectAnswers[indexQst]) {
      scoresOfAnswers[indexQst] = 1;
    } else {
      scoresOfAnswers[indexQst] = -1;
    }
    nextQuestion();
    update();
  }

  goToScorePage() {
    Get.offNamed(AppRoutes.score, parameters: {"score": score.toString()});
  }

  @override
  void onInit() async {
    await loadQuestion(categories[0]);
    pageController = PageController();
    countDownController = CountDownController();
    getAllOptionsOfQuestion();
    getAllCorrectAnswers();
    for (var i = 0; i < nbrOfQst; i++) {
      scoresOfAnswers.add(0);
      // questionsIsAnswered.add(false);
    }
    initialeAnswers();
    super.onInit();
  }

  @override
  void dispose() {
    request.clear();
    options.clear();
    allCorrectAnswers.clear();
    allOptionsOfQst.clear();
    selectedAnswers.clear();
    scoresOfAnswers.clear();
    pageController.dispose();
    super.dispose();
  }
}















































// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qcmapp/data/datasource/exemples/staticdata.dart';
// import 'package:qcmapp/data/model/question_model.dart';

// class QuestionController extends GetxController {}

// class QuestionControllerImp extends QuestionController {
//   bool _isPressed = false;
//   double _numberOfQuestion = 1;
//   int? _selectedAnswer;
//   int countOfCorrectAnswer = 0;
//   final RxInt _min = 30.obs;
//   bool get isPressed => _isPressed;
//   double get numberOfQuestion => _numberOfQuestion;
//   int? get selectedAnswer => _selectedAnswer;
//   RxInt get min => _min;
//   int countOfQuestion = questionList.length;
//   int? correctAnswer;
//   final Map<int, bool> questionIsAnswered = {};
//   Timer? timer;
//   final int maxMin = 30;
//   late PageController pageController;

//   @override
//   void onInit() {
//     pageController = PageController();
//     resetAnswer();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   double get scoreResult => countOfCorrectAnswer * 100 / countOfQuestion;

//   void checkAnswer(int selectedAnswer, QuestionModel questionModel) {
//     _isPressed = true;
//     _selectedAnswer = selectedAnswer;
//     correctAnswer = questionModel.answer;
//     if (correctAnswer == _selectedAnswer) {
//       countOfCorrectAnswer++;
//     }
//     stopTimer();
//     questionIsAnswered.update(questionModel.id, (value) => true);
//     Future.delayed(const Duration(milliseconds: 500))
//         .then((value) => nextQuestion());
//     update();
//   }

//   bool checkQuestionIsAnswered(int questionId) {
//     return questionIsAnswered.entries
//         .firstWhere((element) => element.key == questionId)
//         .value;
//   }

//   void resetAnswer() {
//     for (var element in questionList) {
//       questionIsAnswered.addAll({element.id: false});
//     }
//     update();
//   }

//   Color getColor(int answer) {
//     if (_isPressed) {
//       return Colors.blue;
//     }
//     return Colors.red;
//   }

//   void stopTimer() {
//     timer!.cancel();
//   }

//   nextQuestion() {
//     if (timer != null || timer!.isActive) {
//       stopTimer();
//     }
//     if (pageController.page == 9) {
//       //TODO GO TO RESULT
//     } else {
//       _isPressed = false;
//       pageController.nextPage(
//           duration: const Duration(milliseconds: 500), curve: Curves.linear);
//       startTimer();
//     }
//     _numberOfQuestion = pageController.page! + 2;
//     update();
//   }

//   void startTimer() {
//     resetTimer();
//     timer = Timer.periodic(const Duration(minutes: 1), (timer) {
//       if (_min.value > 0) {
//         _min.value--;
//       } else {
//         stopTimer();
//         goToScore();
//       }
//     });
//   }

//   void resetTimer() {
//     _min.value = maxMin;
//   }

//   void goToScore() {}
//   void startAgain() {
//     correctAnswer = null;
//     countOfCorrectAnswer = 0;
//     _selectedAnswer = null;
//     resetAnswer();
//     //TODO NAVIGAET TO WELCOME SCREEN
//   }
// }
