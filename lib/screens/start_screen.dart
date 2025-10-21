import 'package:flutter/material.dart';
import '../widgets/icon_container.dart';
import 'quiz_screen.dart';
import '../models/question_model.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconContainer(icon: Icons.play_circle_outline, size: 84),
              SizedBox(height: 28),
              Text(
                'Flutter & Dart\nQuiz Challenge',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium!.copyWith(fontSize: 32),
              ),
              SizedBox(height: 12),
              Text(
                '${sampleQuestions.length} Questions • Multiple Topics',
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 18),
              Text(
                'Test your Flutter and Dart knowledge!',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.play_arrow),
                  label: Text('Start Quiz'),
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 450),
                      pageBuilder: (_, __, ___) =>
                          QuizScreen(questions: sampleQuestions),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ));
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
