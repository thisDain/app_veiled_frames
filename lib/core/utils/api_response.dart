class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data; // Generic type for flexibility

  ApiResponse({required this.success, required this.message, this.data});

  // Factory method for success
  factory ApiResponse.success(T data, {String message = "Success"}) {
    return ApiResponse(success: true, message: message, data: data);
  }

  // Factory method for failure
  factory ApiResponse.failure(String message) {
    return ApiResponse(success: false, message: message);
  }
}
