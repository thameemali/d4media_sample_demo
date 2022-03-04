import 'package:d4media_sample_demo_app/api/error_handler/server_error.dart';

class BaseModel<T> {
  ServerError? _error;
  T? data;

  setException(ServerError error) {
    _error = error;
  }

  setData(T data) {
    this.data = data;
  }

  get getException {
    return _error;
  }
}
