class UfModel {
  UfModel({required this.name, required this.initials});

  final String name;
  final String initials;

  factory UfModel.fromMap(Map<String, dynamic> map) {
    return UfModel(
      name: map['nome'] as String,
      initials: map['sigla'] as String,
    );
  }

  @override
  String toString() => 'UfModel(name: $name, initials: $initials)';
}
