// Add Failure types for "either-usage"
abstract class Failure {
  final String message;
  
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class RequestCancelledFailure extends Failure {
  const RequestCancelledFailure() : super(message: "Request was cancelled");
}