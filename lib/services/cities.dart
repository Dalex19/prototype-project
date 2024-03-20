import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_startup/models/dropdown_items.dart';

class Cities {

  static Future<List<DropdownItems>?> getCities(String iso2Code) async {
  var headers = {
    'X-CSCAPI-KEY': 'OWx3dUZtVzZTbWs2SkVLdjNQNU5PRTdxUGMzYm9pRGhTdFJuWGZNVw==',
  };

  var url = Uri.parse('https://api.countrystatecity.in/v1/countries/$iso2Code/cities');

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    List<DropdownItems> dropdownItemsList = jsonResponse.map((item) => DropdownItems.fromJson(item)).toList();
    
    return dropdownItemsList;
  } else {
   
    return null;
  }
}
}
