// ignore_for_file: public_member_api_docs, sort_constructors_first
class CityModel {
  CityModel({required this.id, required this.name, required this.microregion});

  final int id;
  final String name;
  final String microregion;

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'],
      name: map['nome'] as String,
      microregion: map['microrregiao']['nome'] as String,
    );
  }

  @override
  String toString() => 'CityModel(id: $id, name: $name, microregion: $microregion)';
}
