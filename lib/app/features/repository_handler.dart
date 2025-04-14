import 'package:result_dart/result_dart.dart';

Future<Result<T>> repositoryHandler<T extends Object>(
  Future<T> Function() action,
) async {
  try {
    var result = await action();
    return Success(result);
  } catch (e) {
    final exception = e is Exception ? e : Exception(e.toString());
    return Failure(
      exception,
    );
  }
}
