import 'package:brasil_cripto/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class SnackBarHelper {
  static double defaultFontSize = 14;
  static showSuccessfulMessage(String message) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      context: navKey.currentContext!,
      showProgressBar: false,
      dragToClose: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.none,
      ),
      icon: const Icon(
        Icons.circle,
        color: Colors.transparent,
        size: 0,
      ),
      backgroundColor: const Color(0xFF9BECB8),
      title: Text(message,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: defaultFontSize,
          )),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static showWarningMessage(String message) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      context: navKey.currentContext!,
      showProgressBar: false,
      dragToClose: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.none,
      ),
      icon: const Icon(
        Icons.circle,
        color: Colors.transparent,
        size: 0,
      ),
      backgroundColor: const Color(0xFFFAEA9B),
      title: Text(message,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: defaultFontSize,
          )),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static showErrorMessage(String message) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      context: navKey.currentContext!,
      showProgressBar: false,
      dragToClose: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.none,
      ),
      icon: const Icon(
        Icons.circle,
        color: Colors.transparent,
        size: 0,
      ),
      backgroundColor: const Color(0xFFFF9999),
      title: Text(message,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: defaultFontSize,
          )),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
