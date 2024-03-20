import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import 'dropdown_example.dart';

class Location extends StatelessWidget {
  final CountryCode? picked;
  const Location({super.key, required this.picked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Pais",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    picked!.flagImage(width: 30),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(picked!.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400))
                  ],
                ),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ciudad",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              DropdownExample(isoCode2: picked?.code)
            ],
          ),
        ],
      ),
    );
  }
}
