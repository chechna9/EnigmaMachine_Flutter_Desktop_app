import 'package:enigma_simulator/constants.dart';

import 'package:flutter/material.dart';

class KeyWindow extends StatefulWidget {
  const KeyWindow({Key? key}) : super(key: key);

  @override
  State<KeyWindow> createState() => _KeyWindowState();
}

class _KeyWindowState extends State<KeyWindow> {
  List<String> rotors = ["R1", "R2", "R3"];
  List<String> decalageValues = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25"
  ];

  //first rotor conrollers
  String firstRotor = "R1";
  String firstRotorDirection = "D";
  String firstRotorSigne = "+";
  String firstRotorDecalage = "1";
  //Second rotor values
  String secondRotor = "R2";
  String secondRotorDirection = "D";
  String secondRotorSigne = "+";
  String secondRotorDecalage = "1";
  //third rotor values
  String thirdRotor = "R3";
  String thirdRotorDirection = "D";
  String thirdRotorSigne = "+";
  String thirdRotorDecalage = "1";
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
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //first key
            const SizedBox(
              height: 10,
            ),
            Row(
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
                    value: firstRotor,
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
                    onChanged: ((value) => {}),
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
                    value: firstRotorDirection,
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
                    onChanged: ((value) => {}),
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
                    value: firstRotorSigne,
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
                    onChanged: ((value) => {}),
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
                    value: firstRotorDecalage,
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
                    onChanged: ((value) => {}),
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
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            color: myBlue,
            borderRadius: BorderRadius.circular(10),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: myGreen,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () => {},
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
        ),
      ],
    );
  }
}
