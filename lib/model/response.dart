import 'dart:convert';

import 'package:the_internet_folks/model/content.dart';

class Response {
  Content? content;
  bool? status;

  Response({
    this.content,
    this.status,
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

    if (content != null) {
      result.addAll({'content': content!.toMap()});
    }
    if (status != null) {
      result.addAll({'status': status});
    }

    return result;
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      content: map['content'] != null ? Content.fromMap(map['content']) : null,
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  List<Response> listOfResponses(String source) {
    return (json.decode(source) as List)
        .map((i) => Response.fromJson(i))
        .toList();
  }

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
