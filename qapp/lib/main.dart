import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const Qapp());
}

class Qapp extends StatelessWidget {
  const Qapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Center(
            child: Text(
              "Quistions App",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightanswers = 0;

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == correctAnswer) {
        rightanswers++;
        answerResult.add(const Padding(
          padding: EdgeInsets.all(4.0),
          child: GreenIcon(),
        ));
      } else {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(4.0),
          child: RedIcon(),
        ));
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "انتهاء الاختبار",
          desc: "لقد أجبت على $rightanswers من أصل 7",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: const Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();

        appBrain.reset();

        answerResult = [];
        rightanswers = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  // ignore: non_constant_identifier_names
  List<String> myString = ["String 1", "String 2", "String 3"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
            flex: 5,
            child: Column(
              children: [
                Image.asset(appBrain.getQuestionImage()),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  appBrain.getQuestionText(),
                  style: const TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                )
              ],
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            onPressed: () {
              checkAnswer(true);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.green),
            ),
            child: const Text(
              "صح",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            onPressed: () {
              checkAnswer(false);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            child: const Text(
              "خطأ",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ))
      ],
    );
  }
}

class RedIcon extends StatelessWidget {
  const RedIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.thumb_down,
      color: Colors.red,
    );
  }
}

class GreenIcon extends StatelessWidget {
  const GreenIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.thumb_up,
      color: Colors.green,
    );
  }
}
