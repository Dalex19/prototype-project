import 'package:flutter/material.dart';

class TeamForm extends StatefulWidget {
  TextEditingController teamnameController;
  TextEditingController numberParticipantsController;

  TeamForm(
      {super.key,
      required this.teamnameController,
      required this.numberParticipantsController});

  @override
  State<TeamForm> createState() => _TeamFormState();
}

class _TeamFormState extends State<TeamForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.teamnameController,
          decoration: const InputDecoration(
            labelText: 'Nombre del equipo',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: widget.numberParticipantsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Numero de miembros',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
