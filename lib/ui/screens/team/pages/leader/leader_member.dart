import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_startup/ui/screens/widgets/location.dart';
import 'package:my_startup/ui/screens/widgets/user_form.dart';

import '../../../widgets/register_member.dart';

class LeaderMember extends StatefulWidget {
  int numberOfParticipants = 0;
  String teamName;
  LeaderMember({
    Key? key,
    required this.numberOfParticipants,
    required this.teamName,
  }) : super(key: key);

  @override
  _LeaderMemberState createState() => _LeaderMemberState();
}

class _LeaderMemberState extends State<LeaderMember> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final PageController myPageController = PageController();

  CountryCode? picked;
  bool showPageView = false;

  void updatePicked(CountryCode? newPicked) {
    setState(() {
      picked = newPicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: (!showPageView)
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: picked != null
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Text('Miembro Lider de ${widget.teamName}'),
                    const SizedBox(height: 20),
                    UserForm(updatePicked: updatePicked, picked: picked),
                    const SizedBox(height: 25),
                    if (picked != null) Location(picked: picked),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showPageView = true;
                        });
                      },
                      child: const Text('Continuar'),
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: myPageController,
                    children: List.generate(
                        widget.numberOfParticipants,
                        (index) => RegisterMember(
                              numberScreen: index + 1,
                              colorScreen: Colors.purple,
                              myPageController: myPageController,
                            ))),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
