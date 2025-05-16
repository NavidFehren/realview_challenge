/// Exception thrown when a request is canceled
class RequestCancelledException implements Exception {
  final String message = 'Request was canceled';
}