import 'question.dart';

class AppBrain {
  // ignore: non_constant_identifier_names
  int _Qnumber = 0;

  final List<Question> _questionGroup = [
    Question(
        q: "عدد الكواكب بالمجموعة الشمسية هو ثمانية كواكب",
        i: "images/image-1.jpg",
        a: true),
    Question(q: "القطط هي حيوانات لاحمة", i: "images/image-2.jpg", a: true),
    Question(
        q: "الصين موجودة في القارة الإفريقية",
        i: "images/image-3.jpg",
        a: false),
    Question(q: "الأرض مسطحة وليست كروية", i: "images/image-4.jpg", a: false),
    Question(
        q: "بإستطاعة الانسان البقاء على قيد الحياة بدون أكل اللحوم",
        i: "images/image-5.jpg",
        a: true),
    Question(
        q: "الشمس تدور حول الأرض والأرض تدور حول القمر",
        i: "images/image-6.jpg",
        a: false),
    Question(q: "الحيوانات لا تشعر بالألم", i: "images/image-7.jpg", a: false),
  ];

  void nextQuestion() {
    if (_Qnumber < _questionGroup.length - 1) {
      _Qnumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_Qnumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_Qnumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_Qnumber].questionAnswer;
  }

  bool isFinished() {
    if (_Qnumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset()
  {
    _Qnumber = 0;
  }

}
