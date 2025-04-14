import 'package:brasil_cripto/app/core/async_state/async_data_state.dart';
import 'package:brasil_cripto/app/core/extensions/async_data_state_ext.dart';
import 'package:flutter/material.dart';

import '../loading/default_loading.dart';

class AsyncDataStateBuilder<T> extends StatelessWidget {
  final AsyncDataState<T>? dataState;
  final Widget Function() invalidWidget;
  final Widget Function()? loadingWidget;
  final Widget Function(Exception? error) errorWidget;
  final Widget Function(T data) dataWidget;
  const AsyncDataStateBuilder(
      {super.key,
      required this.dataState,
      this.loadingWidget,
      required this.errorWidget,
      required this.dataWidget,
      required this.invalidWidget});

  @override
  Widget build(BuildContext context) {
    final state = dataState;

    return state.when(
      invalidState: invalidWidget,
      loading: () => loadingWidget?.call() ?? Center(child: DefaultLoading()),
      fetched: dataWidget,
      failed: errorWidget,
    );
  }
}
