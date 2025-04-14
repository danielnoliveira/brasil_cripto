import 'package:brasil_cripto/app/core/async_state/async_data_state.dart';
import 'package:brasil_cripto/app/core/async_state/e_data_state_type.dart';

extension AsyncDataStateExt<T> on AsyncDataState<T>? {
  R when<R>({
    required R Function() invalidState,
    required R Function() loading,
    required R Function(T data) fetched,
    required R Function(Exception error) failed,
  }) {
    switch (this?.state) {
      case AsyncDataStateType.loading:
        return loading();
      case AsyncDataStateType.fetched:
        return fetched(this!.value);
      case AsyncDataStateType.failed:
        return failed(this!.error!);
      case null:
        return invalidState();
    }
  }
}
