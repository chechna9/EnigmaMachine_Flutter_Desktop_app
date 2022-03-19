import 'package:enigma_simulator/components/key.dart';
import 'package:enigma_simulator/components/message.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: KeyWindow(),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            child: MessageWindow(),
          ),
        ),
      ],
    );
  }
}
