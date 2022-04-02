import 'package:enigma_simulator/Providers/errorKeyProvider.dart';
import 'package:enigma_simulator/constants.dart';
import 'package:enigma_simulator/controllers/cle.dart';
import 'package:enigma_simulator/controllers/main_router.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/messageProvider.dart';

class KeyWindow extends StatefulWidget {
  final MainRouter mR;
  const KeyWindow({Key? key, required this.mR}) : super(key: key);

  @override
  State<KeyWindow> createState() => _KeyWindowState();
}

class _KeyWindowState extends State<KeyWindow> {
  @override
  Widget build(BuildContext context) {
    bool _error = Provider.of<KeyError>(context).error;
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
                  if (firstRotor == secondRotor ||
                      firstRotor == thirdRotor ||
                      secondRotor == thirdRotor) {
                    Provider.of<KeyError>(context, listen: false)
                        .setError(true);
                  } else {
                    Provider.of<KeyError>(context, listen: false)
                        .setError(false);
                  }
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
                  if (firstRotor == secondRotor ||
                      firstRotor == thirdRotor ||
                      secondRotor == thirdRotor) {
                    Provider.of<KeyError>(context, listen: false)
                        .setError(true);
                  } else {
                    Provider.of<KeyError>(context, listen: false)
                        .setError(false);
                  }
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
                  if (firstRotor == secondRotor ||
                      firstRotor == thirdRotor ||
                      secondRotor == thirdRotor) {
                    Provider.of<KeyError>(context, listen: false)
                        .setError(true);
                  } else {
                    Provider.of<KeyError>(context, listen: false)
                        .setError(false);
                  }
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
        RotorConfigButton(
          error: _error,
          mR: widget.mR,
        ),
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

class RotorConfigButton extends StatefulWidget {
  final MainRouter mR;
  bool error;
  RotorConfigButton({Key? key, required this.error, required this.mR})
      : super(key: key);

  @override
  State<RotorConfigButton> createState() => _RotorConfigButtonState();
}

class _RotorConfigButtonState extends State<RotorConfigButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      widget.mR.reset();
      widget.mR.config();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myBlue,
        borderRadius: BorderRadius.circular(10),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            color: widget.error ? Colors.red : myGreen,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: widget.error
            ? null
            : () {
                widget.mR.setCle(
                  Cle(
                    order: [
                      int.parse(firstRotor[1]),
                      int.parse(secondRotor[1]),
                      int.parse(thirdRotor[1]),
                    ],
                    directions: [
                      firstRotorDirection == "D" ? 1 : -1,
                      secondRotorDirection == "D" ? 1 : -1,
                      thirdRotorDirection == "D" ? 1 : -1,
                    ],
                    routations: [
                      firstRotorSigne == "-"
                          ? int.parse(firstRotorDecalage) * -1
                          : int.parse(firstRotorDecalage),
                      secondRotorSigne == "-"
                          ? int.parse(secondRotorDecalage) * -1
                          : int.parse(secondRotorDecalage),
                      thirdRotorSigne == "-"
                          ? int.parse(thirdRotorDecalage) * -1
                          : int.parse(thirdRotorDecalage),
                    ],
                  ),
                );
                widget.mR.reset();
                widget.mR.config();
                Provider.of<Messages>(context, listen: false).resetDecrypt();
                Provider.of<Messages>(context, listen: false).resetEncrypt();
                firstOperation = true;
              },
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
