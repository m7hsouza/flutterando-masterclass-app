class AddressModel {
  AddressModel({
    required this.zipCode,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.uf,
    required this.ddd,
  });

  final String zipCode;
  final String street;
  final String neighborhood;
  final String city;
  final String uf;
  final String ddd;

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['cep'] as String,
      street: map['logradouro'] as String,
      neighborhood: map['bairro'] as String,
      city: map['localidade'] as String,
      uf: map['uf'] as String,
      ddd: map['ddd'] as String,
    );
  }

  @override
  String toString() {
    return 'AddressModel(zipCode: $zipCode, street: $street, neighborhood: $neighborhood, city: $city, uf: $uf, ddd: $ddd)';
  }
}
