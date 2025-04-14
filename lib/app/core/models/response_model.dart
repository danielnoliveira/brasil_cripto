class ResponseModel {
  int? _statusCode;
  String? _message;
  dynamic _content;

  int? get statusCode => _statusCode;
  String? get message => _message;
  dynamic get content => _content;

  ResponseModel.fullConstructor(
      int? statusCode, String? message, dynamic content) {
    _content = content;
    _statusCode = statusCode;
    _message = message;
  }

  ResponseModel.codeConstructor(int statusCode) {
    _statusCode = statusCode;
  }

  ResponseModel.codeContentConstructor(int? statusCode, dynamic content) {
    _content = content;
    _statusCode = statusCode;
  }
}
