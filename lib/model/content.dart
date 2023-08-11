import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:the_internet_folks/model/data.dart';
import 'package:the_internet_folks/model/meta.dart';

class Content {
  List<Data>? dataList;
  Meta? metadata;

  Content({
    this.dataList,
    this.metadata,
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

    if (dataList != null) {
      result.addAll({'dataList': dataList!.map((x) => x.toMap()).toList()});
    }
    if (metadata != null) {
      result.addAll({'metadata': metadata!.toMap()});
    }

    return result;
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      dataList: map['dataList'] != null
          ? List<Data>.from(map['dataList']?.map((x) => Data.fromMap(x)))
          : null,
      metadata: map['metadata'] != null ? Meta.fromMap(map['metadata']) : null,
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
