import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class Helpers {

  
  static Future<void> selectCountry(
      BuildContext context, Function(CountryCode) onSelect) async {
    const countryPicker = FlCountryCodePicker();
    final result = await countryPicker.showPicker(context: context);
    if (result != null) {
      onSelect(result);
    }
  }

}
