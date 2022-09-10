class Names {
  late String name;
  late String gender;
  late double probability;
  late int count;

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
