import 'package:flutter/material.dart';
import 'package:my_startup/ui/screens/client/client.dart';
import 'package:my_startup/ui/screens/team/team.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Team(role: "Team"),
                  ),
                );
              },
              child: const Text("Arma tu equipo"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Client(role: "Cliente"),
                  ),
                );
              },
              child: const Text("Busca un equipo"),
            )
          ],
        ),
      ),
    );
  }
}
