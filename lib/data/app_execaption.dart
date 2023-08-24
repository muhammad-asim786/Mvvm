// ignore_for_file: prefer_typing_uninitialized_variables, annotate_overrides

class AppException implements Exception{
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? massage]):super(massage, 'Error During communication');
}
class BadRequestException extends AppException{
  BadRequestException ([String? massage]):super(massage, 'Invalid Request');
}

class UnauthorisedException extends AppException{
  UnauthorisedException ([String? massage]):super(massage, 'Unauthorised  Request');
}