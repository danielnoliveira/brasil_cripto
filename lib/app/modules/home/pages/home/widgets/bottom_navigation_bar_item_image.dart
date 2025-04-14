import 'package:brasil_cripto/app/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarItemImage extends StatelessWidget {
  final IconData icon;
  final bool active;
  const BottomNavigationBarItemImage({
    super.key,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Icon(
        icon,
        size: 24,
        color: active ? AppColors.blue : AppColors.stateBlue,
      ),
    );
  }
}
