import 'package:enigma_simulator/components/LettreBox.dart';
import 'package:enigma_simulator/constants.dart';
import 'package:enigma_simulator/controllers/consts.dart';
import 'package:enigma_simulator/controllers/crypt.dart';
import 'package:enigma_simulator/controllers/main_router.dart';
import 'package:flutter/material.dart';

MainRouter mR = MainRouter();

class Output extends StatefulWidget {
  const Output({Key? key}) : super(key: key);

  @override
  State<Output> createState() => _OutputState();
}

class _OutputState extends State<Output> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Arrays
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: mR.reflecteur
                  .map((e) => LettreBox(
                      animColor: Colors.red,
                      triggerChange: false,
                      caractere: e.toString()))
                  .toList(),
            ),
            //rotor 3
            Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: myGreen,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: mR
                        .getRouteValues(2)[0]
                        .map((e) => LettreBox(
                            animColor: Colors.red,
                            triggerChange: false,
                            caractere: e.toString()))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: mR
                        .getRouteValues(2)[1]
                        .map((e) => LettreBox(
                            animColor: Colors.red,
                            triggerChange: false,
                            caractere: e.toString()))
                        .toList(),
                  ),
                ],
              ),
            ),
            //rotor 2
            Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: myGreen,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: mR
                        .getRouteValues(1)[0]
                        .map((e) => LettreBox(
                            animColor: Colors.red,
                            triggerChange: false,
                            caractere: e.toString()))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: mR
                        .getRouteValues(1)[1]
                        .map((e) => LettreBox(
                            animColor: Colors.red,
                            triggerChange: false,
                            caractere: e.toString()))
                        .toList(),
                  ),
                ],
              ),
            ),
            //rotor 1
            Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: myGreen,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: mR
                        .getRouteValues(0)[0]
                        .map((e) => LettreBox(
                            animColor: Colors.red,
                            triggerChange: false,
                            caractere: e.toString()))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: mR
                        .getRouteValues(0)[1]
                        .map((e) => LettreBox(
                            animColor: Colors.red,
                            triggerChange: false,
                            caractere: e.toString()))
                        .toList(),
                  ),
                ],
              ),
            ),

            const Alphabet(),
          ],
        ),
        //hints
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Réflecteur",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
            const Text(
              "Rotor 3",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
            const Text(
              "Rotor 2",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
            const Text(
              "Rotor 1",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
            EtapSuivante(),
          ],
        ),
      ],
    );
  }
}

class Alphabet extends StatefulWidget {
  const Alphabet({Key? key}) : super(key: key);

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: mR.alghabet
          .map((e) => LettreBox(
              animColor: Colors.red, triggerChange: false, caractere: e))
          .toList(),
    );
  }
}

class EtapSuivante extends StatefulWidget {
  EtapSuivante({Key? key}) : super(key: key);

  @override
  State<EtapSuivante> createState() => _EtapSuivanteState();
}

class _EtapSuivanteState extends State<EtapSuivante> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myBlue,
        borderRadius: BorderRadius.circular(10),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            color: myGreen,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          onSurface: myBlue,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
        ),
        child: const Text(
          "Etape Suivante",
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
