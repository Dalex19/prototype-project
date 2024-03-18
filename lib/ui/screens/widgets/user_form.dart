import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_startup/ui/screens/widgets/my_prefix_icon.dart';

import '../../../helpers/helpers.dart';

class UserForm extends StatefulWidget {
  final void Function(CountryCode?) updatePicked;
  final CountryCode? picked;

  const UserForm({super.key, required this.updatePicked, required this.picked});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _lastnamController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: 'Nombres',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _lastnamController,
          decoration: const InputDecoration(
            labelText: 'Apellidos',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: 'Correo',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Contraseña',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 25),
        TextField(
          controller: _telController,
          onTap: () async {
            Helpers.selectCountry(context, (CountryCode result) {
              setState(() {
                widget.updatePicked(result);
              });
            });
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Numero de telefono",
            prefixIcon: widget.picked != null
                ? MyPrefixIcon(dialCode: widget.picked!.dialCode)
                : Container(),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
