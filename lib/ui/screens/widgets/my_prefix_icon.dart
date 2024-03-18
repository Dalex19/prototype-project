import 'package:flutter/material.dart';

class MyPrefixIcon extends StatelessWidget {
  final String dialCode;

  const MyPrefixIcon({super.key, required this.dialCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 40,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
      ),
      child: Center(
          child: Text(
        dialCode,
        style: const TextStyle(fontSize: 18),
      )),
    );
  }
}
