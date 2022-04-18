class RequestResult {
  bool isSuccess = false;
  String message = '';
  Object? data;

  RequestResult(this.isSuccess, this.message, this.data);

  static RequestResult error(String message) {
    return RequestResult(false, message, null);
  }

  static RequestResult success(Object data) {
    return RequestResult(true, '', data);
  }

  static RequestResult successWithEmpty() {
    return RequestResult(true, '', null);
  }
}