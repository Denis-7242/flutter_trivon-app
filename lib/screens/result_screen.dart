import 'package:flutter/material.dart';
import '../colors.dart';
import '../widgets/icon_container.dart';
import 'start_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  const ResultScreen({required this.score, required this.total, Key? key})
      : super(key: key);

  String performanceMessage() {
    final pct = (score / total) * 100;
    if (pct >= 95) return 'Outstanding!';
    if (pct >= 75) return 'Great Job!';
    if (pct >= 50) return 'Good Effort!';
    return 'Keep Practicing!';
  }

  @override
  Widget build(BuildContext context) {
    final pct = ((score / total) * 100).round();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 40),
          child: Column(
            children: [
              IconContainer(icon: Icons.emoji_events, size: 68),
              SizedBox(height: 22),
              Text('Quiz Completed!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 28)),
              SizedBox(height: 8),
              Text(performanceMessage(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, color: AppColors.textSecondary)),
              SizedBox(height: 28),
              // Score card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 32),
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
                  children: [
                    Text('$score / $total',
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor)),
                    SizedBox(height: 8),
                    Text('$pct%',
                        style: TextStyle(
                            fontSize: 18, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => StartScreen(),
                            transitionsBuilder: (_, animation, __, child) =>
                                FadeTransition(
                                    opacity: animation, child: child),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.refresh),
                      label: Text('Retake'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.incorrect,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => StartScreen(),
                            transitionsBuilder: (_, animation, __, child) =>
                                FadeTransition(
                                    opacity: animation, child: child),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
