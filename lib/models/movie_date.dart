class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });
  late final String maximum;
  late final String minimum;

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maximum'] = maximum;
    _data['minimum'] = minimum;
    return _data;
  }
}
