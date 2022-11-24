class APIResponse<T> {
  APIResponseStatus status = APIResponseStatus.loading;
  T? data;
  String? message;

  APIResponse.loading() : status = APIResponseStatus.loading;
  APIResponse.success(this.data) : status = APIResponseStatus.success;
  APIResponse.error(this.message) : status = APIResponseStatus.error;

  bool get isLoading => status == APIResponseStatus.loading;
  bool get isSuccess => status == APIResponseStatus.success;
  bool get isError => status == APIResponseStatus.error;
}

enum APIResponseStatus { loading, success, error }
