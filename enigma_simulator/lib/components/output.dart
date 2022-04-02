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
          children: [
            Rotor1(
              mR: widget.mR,
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
    List<LettreBox> refl = mR.reflecteur.map(
      (e) {
        return LettreBox(
          animColor: Colors.red,
          triggerChange: false,
          caractere: e.toString(),
        );
      },
    ).toList();
    mR.encryptionInfo['indexes']["reflecteur"] == -1
        ? null
        : refl
            .elementAt(mR.encryptionInfo['indexes']["reflecteur"])
            .setTrigger();

    return Row(
      children: refl,
    );
  }
}

class Rotor1 extends StatelessWidget {
  final MainRouter mR;
  const Rotor1({
    Key? key,
    required this.mR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<int>> rotor1 = mR.getRouteValues(0);

    List<LettreBox> rotor1Forward = rotor1[0]
        .map((e) => LettreBox(
            animColor: Colors.red,
            triggerChange: false,
            caractere: e.toString()))
        .toList();

    mR.encryptionInfo['indexes']['forward'][0] == -1
        ? null
        : rotor1Forward
            .elementAt(mR.encryptionInfo['indexes']['forward'][0])
            .setTrigger();

    List<LettreBox> rotor1Backward = rotor1[1]
        .map((e) => LettreBox(
            animColor: Colors.blue,
            triggerChange: false,
            caractere: e.toString()))
        .toList();
    mR.encryptionInfo['indexes']['backward'][0] == -1
        ? null
        : rotor1Backward
            .elementAt(mR.encryptionInfo['indexes']['backward'][0])
            .setTrigger();

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
            children: rotor1Backward,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: rotor1Forward,
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
    List<List<int>> rotor2 = mR.getRouteValues(1);
    List<LettreBox> rotor2Forward = rotor2[0]
        .map((e) => LettreBox(
            animColor: Colors.red,
            triggerChange: false,
            caractere: e.toString()))
        .toList();

    mR.encryptionInfo['indexes']['forward'][1] == -1
        ? null
        : rotor2Forward
            .elementAt(mR.encryptionInfo['indexes']['forward'][1])
            .setTrigger();

    List<LettreBox> rotor2Backward = rotor2[1]
        .map((e) => LettreBox(
            animColor: Colors.blue,
            triggerChange: false,
            caractere: e.toString()))
        .toList();
    mR.encryptionInfo['indexes']['backward'][1] == -1
        ? null
        : rotor2Backward
            .elementAt(mR.encryptionInfo['indexes']['backward'][1])
            .setTrigger();
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
            children: rotor2Backward,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: rotor2Forward,
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
    List<List<int>> rotor3 = mR.getRouteValues(2);
    List<LettreBox> rotor3Forward = rotor3[0]
        .map((e) => LettreBox(
            animColor: Colors.red,
            triggerChange: false,
            caractere: e.toString()))
        .toList();

    mR.encryptionInfo['indexes']['forward'][2] == -1
        ? null
        : rotor3Forward
            .elementAt(mR.encryptionInfo['indexes']['forward'][2])
            .setTrigger();

    List<LettreBox> rotor3Backward = rotor3[1]
        .map((e) => LettreBox(
            animColor: Colors.blue,
            triggerChange: false,
            caractere: e.toString()))
        .toList();
    mR.encryptionInfo['indexes']['backward'][2] == -1
        ? null
        : rotor3Backward
            .elementAt(mR.encryptionInfo['indexes']['backward'][2])
            .setTrigger();
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
            children: rotor3Backward,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: rotor3Forward,
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
    List<LettreBox> alphabet = widget.mR.alghabet
        .map((e) => LettreBox(
            animColor: Colors.red, triggerChange: false, caractere: e))
        .toList();
    if (widget.mR.encryptionInfo["indexes"]["first"] != -1 &&
        widget.mR.encryptionInfo["indexes"]["last"] != -1) {
      alphabet
          .elementAt(widget.mR.encryptionInfo["indexes"]["first"])
          .setTrigger();
      alphabet
          .elementAt(widget.mR.encryptionInfo["indexes"]["last"])
          .animColor = Colors.blue;

      alphabet
          .elementAt(widget.mR.encryptionInfo["indexes"]["last"])
          .setTrigger();
    }

    return Row(
      children: alphabet,
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
          if (shouldRotate) {
            widget.mR.initAnim();
            print(widget.mR.routate());
          } else {
            if (encryptMode) {
              if (firstOperation) {
                ind = 0;

                Provider.of<Messages>(context, listen: false).resetEncrypt();
                firstOperation = false;
              }

              if (ind < decryptedText.length) {
                Provider.of<Messages>(context, listen: false).addToEncrypt(
                    widget.mR.encryptCaracter(
                        caracter: decryptedText[ind])['encrypted']);

                ind++;
              }
            } else {
              if (firstOperation) {
                ind = 0;
                Provider.of<Messages>(context, listen: false).resetDecrypt();

                firstOperation = false;
              }
              if (ind < encryptedText.length) {
                Provider.of<Messages>(context, listen: false).addToDecrypt(
                    widget.mR.encryptCaracter(
                        caracter: encryptedText[ind])['encrypted']);

                ind++;
              }
            }
          }
          if (ind < decryptedText.length || ind < encryptedText.length)
            setState(() {
              shouldRotate = !shouldRotate;
            });
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
