import 'package:flutter/material.dart';
import 'package:my_startup/services/cities.dart';

import '../../../models/dropdown_items.dart';

class DropdownExample extends StatefulWidget {
  final String? isoCode2;
  const DropdownExample({super.key, required this.isoCode2});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  List<DropdownItems>? cities;
  String? _dropdownValue = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  @override
  void didUpdateWidget(covariant DropdownExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isoCode2 != oldWidget.isoCode2) {
      fetchCities();
    }
  }

  void fetchCities() async {
    try {
      List<DropdownItems>? currentCities =
          await Cities.getCities(widget.isoCode2 as String);
      setState(() {
        _dropdownValue = currentCities?[2].name;
        cities = currentCities;
        isLoading = false; 
      });
    } catch (error) {
      print('Error fetching cities: $error');
      setState(() {
        isLoading =
            false; 
      });
    }
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? DropdownButton<String>(
            value: _dropdownValue,
            onChanged: dropdownCallback,
            items: cities?.map((DropdownItems city) {
              return DropdownMenuItem<String>(
                value: city.name,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Text(
                    city.name,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
          )
        : CircularProgressIndicator();
  }
}
