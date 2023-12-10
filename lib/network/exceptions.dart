class ClientException implements Exception {
  final String message;
  final int statusCode;
  final Map<String, dynamic>? responseData;

  const ClientException({
    required this.message,
    required this.statusCode,
    this.responseData,
  });

  @override
  String toString() {
    return message;
  }
}

class ServerException implements Exception {
  final String message;
  final int statusCode;
  final Map<String, dynamic>? responseData;

  const ServerException({
    required this.message,
    required this.statusCode,
    this.responseData,
  });

  @override
  String toString() {
    return message;
  }
}

class CancelTokenException implements Exception {
  final String message;

  const CancelTokenException({
    required this.message,
  });

  @override
  String toString() {
    return message;
  }
}
