abstract class Result<T> {}

class Success<T> implements Result<T> {
  T data;
  Success({required this.data});
}

class Error<T> implements Result<T> {
  Exception exception;
  Error({required this.exception});
}
