import 'package:brasil_cripto/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoCoinDetailsFound extends StatelessWidget {
  final VoidCallback reloadFn;
  const NoCoinDetailsFound({super.key, required this.reloadFn});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Os detalhes da criptomoeda nao foram encontrados',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 4.2.w,
                color: AppColors.blue),
          ),
        ),
        ElevatedButton.icon(
          onPressed: reloadFn,
          label: Text('Buscar novamente'),
          icon: Icon(Icons.refresh),
        )
      ],
    );
  }
}
