import 'package:brasil_cripto/app/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class ListWarning extends StatelessWidget {
  final String message;
  const ListWarning({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 4.2.w,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
