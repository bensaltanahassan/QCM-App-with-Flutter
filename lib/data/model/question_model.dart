class QuestionModel {
  final String answer;
  final String? question;
  final List<String?>? options;

  QuestionModel(
      {required this.question, required this.answer, required this.options});
}
