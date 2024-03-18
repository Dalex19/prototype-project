import 'package:flutter/material.dart';

class RegisterMember extends StatefulWidget {
  final int numberScreen;
  final Color colorScreen;
  PageController myPageController;

  RegisterMember(
      {super.key,
      required this.numberScreen,
      required this.colorScreen,
      required this.myPageController});

  @override
  State<RegisterMember> createState() => _RegisterMemberState();
}

class _RegisterMemberState extends State<RegisterMember> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.colorScreen,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Register Member ${widget.numberScreen}'),
          ElevatedButton(
            onPressed: () {
              widget.myPageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn);
            },
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }
}
