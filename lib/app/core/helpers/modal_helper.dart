import 'package:brasil_cripto/app/app_widget.dart';
import 'package:flutter/material.dart';

class ModalHelper {
  static Future<void> createLoadingDialog(
      {Color colorCircularLoading = Colors.white}) async {
    return showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (context) {
        return Center(
            child: SizedBox(
          width: 64,
          height: 64,
          child: CircularProgressIndicator(
            color: colorCircularLoading,
            strokeWidth: 6,
          ),
        ));
      },
    );
  }
}
