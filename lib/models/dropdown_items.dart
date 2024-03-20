class DropdownItems {
  late String name, value;

  DropdownItems({required this.name, required this.value});

  // Método para crear un DropdownItems a partir de un mapa
  factory DropdownItems.fromJson(Map<String, dynamic> json) {
    return DropdownItems(
      name: json['name'] ?? '',
      value: json['id'].toString() ?? '', // Suponiendo que 'id' es el valor único asociado al nombre
    );
  }
}