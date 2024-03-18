import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/helpers.dart';

class MyTextButton extends StatefulWidget {
  final void Function(CountryCode?) updatePicked;
  final CountryCode? picked;

  const MyTextButton(
      {super.key, required this.updatePicked, required this.picked});

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          Helpers.selectCountry(context, (CountryCode result) {
            setState(() {
              widget.updatePicked(result);
            });
          });
        },
        child: Text(
          widget.picked != null ? "Actividad en:" : "Selecciona un pais",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ));
  }
}
