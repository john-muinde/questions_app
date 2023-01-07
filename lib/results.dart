import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    resultText = resultScore >= 20 ? "Goood" : "Baaad";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'You did it $resultScore $resultPhrase',
            style: TextStyle(
                fontSize: 38, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: resetQuiz,
          child: Text('Restart Quiz'),
          //         style: TextButton.styleFrom(
          //   primary: Colors.blue,
          //   onSurface: Colors.red,
          // ),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue.withOpacity(0.04);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Colors.blue.withOpacity(0.12);
                return null; // Defer to the widget's default.
              },
            ),
          ),
        ),
      ],
    );
  }
}
