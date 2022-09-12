class Names {
  String? name;
  String? gender;
  double? probability;
  int? count;

  Names({
    required this.name,
    required this.gender,
    required this.probability,
    required this.count,
  });

  Names.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    probability = json['probability'];
    count = json['count'];
  }
}
