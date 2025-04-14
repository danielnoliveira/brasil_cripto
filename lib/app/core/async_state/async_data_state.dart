import 'package:brasil_cripto/app/core/async_state/e_data_state_type.dart';

sealed class AsyncDataState<T> {
  final AsyncDataStateType state;
  final T? valueOrNull;
  final Exception? error;

  AsyncDataState({
    required this.state,
    this.valueOrNull,
    this.error,
  });

  T get value => valueOrNull as T;

  bool get isFetched => state == AsyncDataStateType.fetched;
  bool get isLoading => state == AsyncDataStateType.loading;
  bool get isFailed => state == AsyncDataStateType.failed;

  bool get hasInvalidData {
    if (valueOrNull == null) return true;
    if (valueOrNull is List && (valueOrNull as List).isEmpty) return true;
    return false;
  }
}

class FetchedState<T> extends AsyncDataState<T> {
  FetchedState(T data)
      : super(
          state: AsyncDataStateType.fetched,
          valueOrNull: data,
        );
}

class LoadingState<T> extends AsyncDataState<T> {
  LoadingState()
      : super(
          state: AsyncDataStateType.loading,
        );
}

class FailedState<T> extends AsyncDataState<T> {
  FailedState(Exception error)
      : super(
          state: AsyncDataStateType.failed,
          error: error,
        );
}
