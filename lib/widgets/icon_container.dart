import 'package:flutter/material.dart';
import '../colors.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final double size;
  const IconContainer({required this.icon, this.size = 56, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 40,
      height: size + 40,
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
            color: AppColors.accent.withOpacity(0.1),
            blurRadius: 30,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          size: size,
          color: AppColors.accent,
        ),
      ),
    );
  }
}
