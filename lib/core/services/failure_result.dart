sealed class FailureResult {
  final String message;
  const FailureResult({required this.message});
}

final class ResponseFailed extends FailureResult {
  ResponseFailed({super.message = "Something went wrong!"});
}
