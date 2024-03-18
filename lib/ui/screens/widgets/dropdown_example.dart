import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _dropdownValue = "Matagalpa";

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(items: const [
      DropdownMenuItem(
        value: "Managua",
        child: Text("Managua"),
      ),
      DropdownMenuItem(
        value: "Matagalpa",
        child: Text("Matagalpa"),
      ),
      DropdownMenuItem(
        value: "Esteli",
        child: Text("Esteli"),
      ),
      DropdownMenuItem(
        value: "Jinotega",
        child: Text("Jinotega"),
      ),
      DropdownMenuItem(
        value: "Boaco",
        child: Text("Boaco"),
      ),
    ], value: _dropdownValue, onChanged: dropdownCallback);
  }
}
