import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int? _errorCode = 0;
  // List<String?> _errorMessage = [];
  String _errorMessage = "";

  ServerError(this._errorCode, this._errorMessage);

  ServerError.withErrorAndCode({required DioError error}) {
    _handleErrorAndCode(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    // return _errorMessage.join("");
    return _errorMessage;
  }

  _handleErrorAndCode(DioError error) {
    ServerError serverError;
    switch (error.type) {
      case DioErrorType.cancel:
        _errorCode = error.response!.statusCode;
        // _errorMessage.add("Request was cancelled");
        _errorMessage = "Request was cancelled";
        serverError =  ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.connectTimeout:
        try {
          _errorCode = error.response!.statusCode;
        } catch (e) {
          _errorCode = 101;
        }
        // _errorMessage.add("Connection timeout");
        _errorMessage = "LocaleKeys.timeout.tr";
        serverError =  ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.receiveTimeout:
        _errorCode = error.response!.statusCode;
        // _errorMessage.add("Receive timeout in connection");
        _errorMessage = "LocaleKeys.connection_timeout.tr";
        serverError =  ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.response:
        print('Reached here........');
        _errorCode = error.response!.statusCode;
        if (error.response != null && error.response!.statusMessage!.isNotEmpty) {
          try {
            _errorMessage = error.response!.data['message'].toString();
          } catch (e) {
            _errorMessage = "LocaleKeys.error_someThingWentWrong.tr";
          }
        } else {
          _errorMessage =
          "${"LocaleKeys.invalid_status_code.tr"}: ${error.response!.statusCode}";
        }
        serverError =  ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.sendTimeout:
        _errorCode = error.response!.statusCode;
        _errorMessage = "LocaleKeys.invalid_status.tr";
        serverError =  ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.other:
        _errorCode = 100;
        _errorMessage = "LocaleKeys.no_connection.tr";
        serverError =  ServerError(_errorCode, _errorMessage);
        break;
      default:
        _errorCode = error.response!.statusCode;
        _errorMessage = error.response!.statusMessage ?? "";
        serverError =  ServerError(_errorCode, _errorMessage);
        break;
    }
    return serverError;
  }
}
