import 'package:enigma_simulator/constants.dart';

import 'package:flutter/material.dart';

class KeyWindow extends StatefulWidget {
  const KeyWindow({Key? key}) : super(key: key);

  @override
  State<KeyWindow> createState() => _KeyWindowState();
}

class _KeyWindowState extends State<KeyWindow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "La Clé",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //first keyField
            KeyField(
              info: RotorInfo(
                rotorNumber: firstRotor,
                rotorDirection: firstRotorDirection,
                rotorSign: firstRotorSigne,
                rotorDecalage: firstRotorDecalage,
              ),
              rotorNumber: (e) {
                setState(() {
                  firstRotor = e;
                });
              },
              rotorDirection: (e) {
                setState(() {
                  firstRotorDirection = e;
                });
              },
              rotorSign: (e) {
                setState(() {
                  firstRotorSigne = e;
                });
              },
              rotorDecalage: (e) {
                setState(() {
                  firstRotorDecalage = e;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            KeyField(
              info: RotorInfo(
                rotorNumber: secondRotor,
                rotorDirection: secondRotorDirection,
                rotorSign: secondRotorSigne,
                rotorDecalage: secondRotorDecalage,
              ),
              rotorNumber: (e) {
                setState(() {
                  secondRotor = e;
                });
              },
              rotorDirection: (e) {
                setState(() {
                  secondRotorDirection = e;
                });
              },
              rotorSign: (e) {
                setState(() {
                  secondRotorSigne = e;
                });
              },
              rotorDecalage: (e) {
                setState(() {
                  secondRotorDecalage = e;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            KeyField(
              info: RotorInfo(
                rotorNumber: thirdRotor,
                rotorDirection: thirdRotorDirection,
                rotorSign: thirdRotorSigne,
                rotorDecalage: thirdRotorDecalage,
              ),
              rotorNumber: (e) {
                setState(() {
                  thirdRotor = e;
                });
              },
              rotorDirection: (e) {
                setState(() {
                  thirdRotorDirection = e;
                });
              },
              rotorSign: (e) {
                setState(() {
                  thirdRotorSigne = e;
                });
              },
              rotorDecalage: (e) {
                setState(() {
                  thirdRotorDecalage = e;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        RotorConfigButton(),
      ],
    );
  }
}

class RotorInfo {
  String rotorNumber;
  String rotorDirection;
  String rotorSign;
  String rotorDecalage;
  RotorInfo(
      {required this.rotorDecalage,
      required this.rotorDirection,
      required this.rotorNumber,
      required this.rotorSign});
}

class RotorConfigButton extends StatelessWidget {
  const RotorConfigButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _error = false;

    return Container(
      decoration: BoxDecoration(
        color: myBlue,
        borderRadius: BorderRadius.circular(10),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            color: _error ? Colors.red : myGreen,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: _error ? null : () => {},
        style: TextButton.styleFrom(
          onSurface: myBlue,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
        ),
        child: const Text(
          "Configurer Rotors",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class KeyField extends StatefulWidget {
  final RotorInfo info;
  final Function rotorNumber;
  final Function rotorDirection;
  final Function rotorSign;
  final Function rotorDecalage;

  const KeyField({
    Key? key,
    required this.info,
    required this.rotorNumber,
    required this.rotorDirection,
    required this.rotorSign,
    required this.rotorDecalage,
  }) : super(key: key);

  @override
  State<KeyField> createState() => _KeyFieldState();
}

class _KeyFieldState extends State<KeyField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: myBlue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton(
            isDense: true,
            value: widget.info.rotorNumber,
            dropdownColor: myBlue,
            borderRadius: BorderRadius.circular(15),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: myGreen,
            ),
            style: const TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            underline: Container(),
            onChanged: ((value) => widget.rotorNumber(value)),
            items: rotors
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: myBlue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton(
            isDense: true,
            value: widget.info.rotorDirection,
            dropdownColor: myBlue,
            borderRadius: BorderRadius.circular(15),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: myGreen,
            ),
            style: const TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            underline: Container(),
            onChanged: ((value) => widget.rotorDirection(value)),
            items: ["D", "G"]
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: myBlue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton(
            isDense: true,
            value: widget.info.rotorSign,
            dropdownColor: myBlue,
            borderRadius: BorderRadius.circular(15),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: myGreen,
            ),
            style: const TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            menuMaxHeight: 200,
            underline: Container(),
            onChanged: ((value) => widget.rotorSign(value)),
            items: ["+", "-"]
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: myBlue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton(
            isDense: true,
            value: widget.info.rotorDecalage,
            dropdownColor: myBlue,
            borderRadius: BorderRadius.circular(15),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: myGreen,
            ),
            style: const TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            menuMaxHeight: 200,
            underline: Container(),
            onChanged: ((value) => widget.rotorDecalage(value)),
            items: decalageValues
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
