import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:the_internet_folks/model/data.dart';
import 'package:the_internet_folks/model/meta.dart';

class Content {
  List<Data> dataList;
  Meta metadata;

  Content({
    required this.dataList,
    required this.metadata,
  });

  Content copyWith({
    List<Data>? dataList,
    Meta? metadata,
  }) {
    return Content(
      dataList: dataList ?? this.dataList,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'dataList': dataList.map((x) => x.toMap()).toList()});
    result.addAll({'metadata': metadata.toMap()});

    return result;
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      dataList: List<Data>.from(map['dataList']?.map((x) => Data.fromMap(x))),
      metadata: Meta.fromMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) =>
      Content.fromMap(json.decode(source));

  @override
  String toString() => 'Content(dataList: $dataList, metadata: $metadata)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Content &&
        listEquals(other.dataList, dataList) &&
        other.metadata == metadata;
  }

  @override
  int get hashCode => dataList.hashCode ^ metadata.hashCode;
}
