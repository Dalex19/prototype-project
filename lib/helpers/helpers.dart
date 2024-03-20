import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class Helpers {
  static Future<void> selectCountry(
      BuildContext context, Function(CountryCode) onSelect) async {
    const countryPicker = FlCountryCodePicker(
      title: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 7),
        child: Center(
          child: Text(
            "Selecciona tu País",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      filteredCountries: ['GT', 'PA', 'CR', "NI", "HN", "BLZ", "SV"],
      showSearchBar: false,
    );
    final result = await countryPicker.showPicker(context: context);
    if (result != null) {
      onSelect(result);
    }
  }
}
