import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_startup/ui/screens/widgets/location.dart';
import 'package:my_startup/ui/screens/team/pages/leader/leader_member.dart';
import 'package:my_startup/ui/screens/team/widgets/my_text_button.dart';
import 'package:my_startup/ui/screens/team/widgets/team_form.dart';

class Team extends StatefulWidget {
  final String role;

  const Team({required this.role, Key? key}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final TextEditingController _teamnameController = TextEditingController();
  final TextEditingController _numberParticipantsController =
      TextEditingController();
  CountryCode? picked;
  int numberOfParticipants = 0;

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
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: picked != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Text('Has seleccionado el rol: ${widget.role}'),
              const SizedBox(height: 20),
              TeamForm(
                  teamnameController: _teamnameController,
                  numberParticipantsController: _numberParticipantsController),
              const SizedBox(height: 20),
              MyTextButton(updatePicked: updatePicked, picked: picked),
              if (picked != null) Location(picked: picked),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  numberOfParticipants =
                      int.tryParse(_numberParticipantsController.text) ?? 0;
                  _register();
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void _register() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LeaderMember(
                  numberOfParticipants: numberOfParticipants,
                  teamName: _teamnameController.text,
                  picked: picked,
                  updatePicked: updatePicked,
                )));
  }

  @override
  void dispose() {
    _teamnameController.dispose();
    _numberParticipantsController.dispose();
    super.dispose();
  }
}
