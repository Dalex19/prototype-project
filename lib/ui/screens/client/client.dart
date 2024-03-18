import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_startup/ui/screens/widgets/location.dart';
import 'package:my_startup/ui/screens/widgets/user_form.dart';

class Client extends StatefulWidget {
  final String role;

  const Client({required this.role, Key? key}) : super(key: key);

  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<Client> {
  CountryCode? picked;

  void updatePicked(CountryCode? newPicked) {
    setState(() {
      picked = newPicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de Rol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: picked != null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Text('Has seleccionado el rol: ${widget.role}'),
                const SizedBox(height: 20),
                UserForm(updatePicked: updatePicked, picked: picked),
                if (picked != null) Location(picked: picked),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _usernameController.dispose();
    // _passwordController.dispose();
    super.dispose();
  }
}
