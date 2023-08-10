import 'dart:convert';

class Meta {
  int total;
  Meta({
    required this.total,
  });

  Meta copyWith({
    int? total,
  }) {
    return Meta(
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'total': total});

    return result;
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meta.fromJson(String source) => Meta.fromMap(json.decode(source));

  @override
  String toString() => 'Meta(total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Meta && other.total == total;
  }

  @override
  int get hashCode => total.hashCode;
}
