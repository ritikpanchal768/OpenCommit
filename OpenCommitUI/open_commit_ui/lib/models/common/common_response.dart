class CommonResponse<T> {
  final String code;
  final String responseMessage;
  final bool isValid;
  final T? responseObject;

  CommonResponse({
    required this.code,
    required this.responseMessage,
    required this.isValid,
    this.responseObject,
  });

  factory CommonResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return CommonResponse<T>(
      code: json['code']?.toString() ?? '0',
      responseMessage: json['responseMessage']?.toString() ?? 'No message provided',
      isValid: json['valid'] ?? json['isValid'] ?? false,
      responseObject: json['responseObject'] != null
          ? fromJsonT(json['responseObject'])
          : null,
    );
  }
}
