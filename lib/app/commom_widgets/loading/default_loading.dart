import 'package:brasil_cripto/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultLoading extends StatelessWidget {
  final Color? color;
  const DefaultLoading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? AppColors.blue,
      strokeWidth: 4,
    );
  }
}
