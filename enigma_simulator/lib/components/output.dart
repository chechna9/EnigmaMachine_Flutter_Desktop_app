import 'package:enigma_simulator/Providers/messageProvider.dart';
import 'package:enigma_simulator/components/LettreBox.dart';
import 'package:enigma_simulator/constants.dart';
import 'package:enigma_simulator/controllers/consts.dart';
import 'package:enigma_simulator/controllers/crypt.dart';
import 'package:enigma_simulator/controllers/main_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Output extends StatefulWidget {
  final MainRouter mR;
  const Output({Key? key, required this.mR}) : super(key: key);

  @override
  State<Output> createState() => _OutputState();
}

class _OutputState extends State<Output> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //reflacteur
        Transform.translate(
          offset: const Offset(15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Reflecteur(
                mR: widget.mR,
              ),
              const Text(
                "Réflecteur",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        //Rotor 3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Rotor3(
              mR: widget.mR,
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
          ],
        ),
        //Rotor 2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Rotor2(
              mR: widget.mR,
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
          ],
        ),
        //Rotor 1
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Rotor1(),
            Text(
              "Rotor 1",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
          ],
        ),
        //Alphabet
        Transform.translate(
          offset: const Offset(25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Alphabet(
                mR: widget.mR,
              ),
              EtapSuivante(
                mR: widget.mR,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Reflecteur extends StatelessWidget {
  final MainRouter mR;
  Reflecteur({Key? key, required this.mR}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: mR.reflecteur
          .map((e) => LettreBox(
              animColor: Colors.red,
              triggerChange: false,
              caractere: e.toString()))
          .toList(),
    );
  }
}

class Rotor1 extends StatelessWidget {
  const Rotor1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<int>> rotor1 = Provider.of<MainRouter>(context).getRouteValues(0);

    return Container(
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
            children: rotor1[0]
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
            children: rotor1[1]
                .map((e) => LettreBox(
                    animColor: Colors.red,
                    triggerChange: false,
                    caractere: e.toString()))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class Rotor2 extends StatelessWidget {
  final MainRouter mR;
  const Rotor2({Key? key, required this.mR}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class Rotor3 extends StatelessWidget {
  final MainRouter mR;
  const Rotor3({Key? key, required this.mR}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class Alphabet extends StatefulWidget {
  final MainRouter mR;
  const Alphabet({Key? key, required this.mR}) : super(key: key);

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.mR.alghabet
          .map((e) => LettreBox(
              animColor: Colors.red, triggerChange: false, caractere: e))
          .toList(),
    );
  }
}

class EtapSuivante extends StatefulWidget {
  final MainRouter mR;
  EtapSuivante({Key? key, required this.mR}) : super(key: key);

  @override
  State<EtapSuivante> createState() => _EtapSuivanteState();
}

class _EtapSuivanteState extends State<EtapSuivante> {
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    String decryptedText = Provider.of<Messages>(context).decryptedText;
    String encryptedText = Provider.of<Messages>(context).encryptedText;
    return Container(
      decoration: BoxDecoration(
        color: myBlue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: myGreen,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          if (encryptMode) {
            if (firstOperation) {
              ind = 0;

              Provider.of<Messages>(context, listen: false).resetEncrypt();
              firstOperation = false;
            }

            if (ind < decryptedText.length) {
              Provider.of<Messages>(context, listen: false).addToEncrypt(widget
                  .mR
                  .encryptCaracter(caracter: decryptedText[ind])['encrypted']);

              ind++;
            }
          } else {
            if (firstOperation) {
              ind = 0;
              Provider.of<Messages>(context, listen: false).resetDecrypt();

              firstOperation = false;
            }
            if (ind < encryptedText.length) {
              Provider.of<Messages>(context, listen: false).addToDecrypt(widget
                  .mR
                  .encryptCaracter(caracter: encryptedText[ind])['encrypted']);

              ind++;
            }
          }
        },
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
