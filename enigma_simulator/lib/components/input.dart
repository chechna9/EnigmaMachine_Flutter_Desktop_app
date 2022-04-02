import 'package:enigma_simulator/components/key.dart';
import 'package:enigma_simulator/components/message.dart';
import 'package:flutter/material.dart';

import '../controllers/main_router.dart';

class Input extends StatefulWidget {
  final MainRouter mR;
  const Input({Key? key, required this.mR}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: KeyWindow(mR: widget.mR),
        ),
        Expanded(
          child: MessageWindow(mR: widget.mR),
        ),
      ],
    );
  }
}
