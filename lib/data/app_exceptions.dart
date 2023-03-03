class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix:$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? _message])
      : super(_message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? _message])
      : super(_message, "Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? _message])
      : super(_message, "Unauthorized Request");
}
