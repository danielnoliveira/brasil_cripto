import 'package:brasil_cripto/app/core/enums/http_method.dart';
import 'package:brasil_cripto/app/core/models/response_model.dart';
import 'package:brasil_cripto/app/core/services/interfaces/i_api_service.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class FunctionHelper {
  static Future<Result<T>> handleApiRequest<T extends Object>({
    required IApiService apiService,
    required HttpRequestMethod method,
    required String route,
    Map<String, dynamic> Function()? getBody,
    bool Function(ResponseModel result)? checkReturn,
    required T Function(ResponseModel result) successReturn,
    String Function(ResponseModel result)? customErrorHandler,
  }) async {
    try {
      final result = await apiService.fetch(
        method,
        route,
        body: getBody?.call(),
      );

      final isSuccess = (checkReturn ?? (r) => r.statusCode == 200)(result);

      if (isSuccess) {
        return Success(successReturn(result));
      }

      final errorMessage =
          customErrorHandler?.call(result) ?? result.message ?? 'Unknown error';

      return Failure(Exception(errorMessage));
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  // static void performAsyncOperation<T extends Object>(
  //   Future<Result<T, MainException>> Function() asyncOperation, {
  //   String? successMessage,
  //   String? errorMessage,
  //   VoidCallback? beforeAsyncOperation,
  //   VoidCallback? afterAsyncOperation,
  //   void Function(T)? successBlock,
  //   void Function(MainException exception)? errorBlock,
  //   void Function(Object exception)? catchBlock,
  // }) async {
  //   // Display the loading dialog
  //   ModalHelper.createModalLoadingDialog();
  //   bool isModalPopuped = false;
  //   try {
  //     runIfNotNull(beforeAsyncOperation);
  //     // Perform the asynchronous operation
  //     var result = await asyncOperation();
  //     runIfNotNull(afterAsyncOperation);
  //     // Dismiss the loading dialog
  //     Modular.to.pop();
  //     isModalPopuped = true;
  //     // Check if the result is successful
  //     if (result.isSuccess()) {
  //       if (successBlock != null) {
  //         successBlock(result.getOrThrow());
  //       } else {
  //         // Ensure the widget is still mounted
  //         if (navKey.currentContext!.mounted && successMessage != null) {
  //           // Show a success message
  //           SnackBarHelper.showSuccessfulMessage(successMessage);
  //         }
  //       }
  //     } else {
  //       if (errorBlock != null) {
  //         errorBlock(result.exceptionOrNull()!);
  //       } else {
  //         // Handle the error case
  //         final me = result.exceptionOrNull();
  //         if (navKey.currentContext!.mounted) {
  //           String message = errorMessage ?? me!.getMessage();
  //           SnackBarHelper.showErrorMessage(message);
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     if (catchBlock != null) {
  //       catchBlock(e);
  //     }
  //     // Handle any other exceptions that might occur
  //     if (!isModalPopuped) {
  //       Modular.to.pop();
  //     }
  //     if (navKey.currentContext!.mounted) {
  //       SnackBarHelper.showErrorMessage('An unexpected error occurred');
  //     }
  //   }
  // }
}

void runIfNotNull(VoidCallback? callback) {
  if (callback == null) {
    return;
  }
  callback();
}
