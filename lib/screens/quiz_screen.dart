import 'package:flutter/material.dart';
import 'dart:async';
import '../colors.dart';
import '../models/question_model.dart';
import '../widgets/answer_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  const QuizScreen({required this.questions, Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  int? selectedIndex;
  bool showResultForCurrent = false;
  static const int questionDurationSeconds = 15;
  Timer? _timer;
  double _remainingSeconds = questionDurationSeconds.toDouble();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _remainingSeconds = questionDurationSeconds.toDouble();
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      setState(() {
        _remainingSeconds = (_remainingSeconds - 1)
            .clamp(0, questionDurationSeconds)
            .toDouble();
      });
      if (_remainingSeconds <= 0) {
        t.cancel();
        _onTimeUp();
      }
    });
  }

  void _onTimeUp() {
    if (!mounted) return;
    if (currentIndex < widget.questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
        showResultForCurrent = false;
      });
      _startTimer();
    } else {
      Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (_, __, ___) =>
            ResultScreen(score: score, total: widget.questions.length),
        transitionsBuilder: (_, animation, __, child) {
          return ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.easeOutBack)),
              child: FadeTransition(opacity: animation, child: child));
        },
      ));
    }
  }

  void selectOption(int idx) {
    if (selectedIndex != null) return;
    _timer?.cancel();
    setState(() {
      selectedIndex = idx;
      showResultForCurrent = true;
      if (idx == widget.questions[currentIndex].correctIndex) score++;
    });

    Future.delayed(Duration(milliseconds: 900), () {
      if (!mounted) return;
      if (currentIndex < widget.questions.length - 1) {
        setState(() {
          currentIndex++;
          selectedIndex = null;
          showResultForCurrent = false;
        });
        _startTimer();
      } else {
        _timer?.cancel();
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) =>
              ResultScreen(score: score, total: widget.questions.length),
          transitionsBuilder: (_, animation, __, child) {
            return ScaleTransition(
                scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.easeOutBack)),
                child: FadeTransition(opacity: animation, child: child));
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[currentIndex];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // Top bar: category and progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.card,
                          AppColors.cardLight,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.border.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.help_outline,
                      color: AppColors.accent,
                      size: 24,
                    ),
                  ),
                  Column(
                    children: [
                      Text(q.category.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(letterSpacing: 1.2, fontSize: 14)),
                      SizedBox(height: 4),
                      Text(
                          'Question ${currentIndex + 1} of ${widget.questions.length}',
                          style: TextStyle(
                              color: AppColors.textSecondary, fontSize: 12))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Score',
                          style: TextStyle(
                              color: AppColors.textSecondary, fontSize: 12)),
                      SizedBox(height: 4),
                      Text('$score',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 22),
              // Timer bar and countdown
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.border.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor:
                            (_remainingSeconds / questionDurationSeconds)
                                .clamp(0.0, 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.accent, AppColors.accentLight],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('${_remainingSeconds.toInt()}s',
                      style: TextStyle(
                          color: AppColors.textSecondary, fontSize: 12))
                ],
              ),
              SizedBox(height: 12),

              // Question card
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.card,
                        AppColors.cardLight,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.border.withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.05),
                        blurRadius: 30,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(q.question,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20)),
                      SizedBox(height: 18),
                      Expanded(
                        child: ListView.separated(
                          itemCount: q.options.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final option = q.options[index];
                            final bool isSelected = selectedIndex == index;
                            final bool isCorrect = q.correctIndex == index;
                            Color? tileColor;
                            IconData? trailingIcon;

                            if (selectedIndex != null) {
                              if (isSelected && isCorrect) {
                                tileColor = AppColors.correct.withOpacity(0.2);
                                trailingIcon = Icons.check_circle;
                              } else if (isSelected && !isCorrect) {
                                tileColor =
                                    AppColors.incorrect.withOpacity(0.2);
                                trailingIcon = Icons.cancel;
                              } else if (!isSelected && isCorrect) {
                                tileColor = AppColors.correct.withOpacity(0.15);
                                trailingIcon = Icons.check_circle_outline;
                              } else {
                                tileColor = AppColors.border.withOpacity(0.1);
                              }
                            } else {
                              tileColor = Colors.transparent;
                            }

                            return AnimatedContainer(
                              duration: Duration(milliseconds: 220),
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                color: tileColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: AnswerButton(
                                label: option,
                                letter: String.fromCharCode(65 + index),
                                onTap: () => selectOption(index),
                                background: tileColor,
                                trailingIcon: trailingIcon,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      // Enhanced progress bar
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.border.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor:
                              (currentIndex + 1) / widget.questions.length,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.accent,
                                  AppColors.accentLight
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14),
              // Bottom controls
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.chevron_left),
                      label: Text('Previous'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textColor,
                        side: BorderSide(color: Colors.white12),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: currentIndex > 0
                          ? () {
                              setState(() {
                                currentIndex--;
                                selectedIndex = null;
                                showResultForCurrent = false;
                              });
                              _startTimer();
                            }
                          : null,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.skip_next),
                      label: Text('Skip / Next'),
                      onPressed: () {
                        if (currentIndex < widget.questions.length - 1) {
                          setState(() {
                            currentIndex++;
                            selectedIndex = null;
                            showResultForCurrent = false;
                          });
                          _startTimer();
                        } else {
                          _timer?.cancel();
                          Navigator.of(context)
                              .pushReplacement(PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 600),
                            pageBuilder: (_, __, ___) => ResultScreen(
                                score: score, total: widget.questions.length),
                            transitionsBuilder: (_, animation, __, child) {
                              return ScaleTransition(
                                  scale: Tween<double>(begin: 0.9, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOutBack)),
                                  child: FadeTransition(
                                      opacity: animation, child: child));
                            },
                          ));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
