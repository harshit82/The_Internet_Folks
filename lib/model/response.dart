import 'dart:convert';

import 'package:the_internet_folks/model/content.dart';

class Response {
  Content content;
  bool status;

  Response({
    required this.content,
    required this.status,
  });

  Response copyWith({
    Content? content,
    bool? status,
  }) {
    return Response(
      content: content ?? this.content,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'content': content.toMap()});
    result.addAll({'status': status});

    return result;
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      content: Content.fromMap(map['content']),
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Response.fromJson(String source) =>
      Response.fromMap(json.decode(source));

  @override
  String toString() => 'Response(content: $content, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Response &&
        other.content == content &&
        other.status == status;
  }

  @override
  int get hashCode => content.hashCode ^ status.hashCode;
}
