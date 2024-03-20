class DropdownItems {
  late String name, value;

  DropdownItems({required this.name, required this.value});

  
  factory DropdownItems.fromJson(Map<String, dynamic> json) {
    return DropdownItems(
      name: json['name'] ?? '',
      value: json['id'].toString(),
    );
  }
}