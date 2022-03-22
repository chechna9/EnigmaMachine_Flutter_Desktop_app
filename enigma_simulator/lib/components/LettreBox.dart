import 'package:enigma_simulator/constants.dart';
import 'package:flutter/material.dart';

class LettreBox extends StatefulWidget {
  final Color animColor;
  final bool triggerChange;
  final String caractere;
  const LettreBox(
      {Key? key,
      required this.animColor,
      required this.triggerChange,
      required this.caractere})
      : super(key: key);

  @override
  State<LettreBox> createState() => _LettreBoxState();
}

class _LettreBoxState extends State<LettreBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: myBlue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: widget.triggerChange ? widget.animColor : myGreen,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Text(
        widget.caractere,
        style: const TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
