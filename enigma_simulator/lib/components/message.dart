import 'package:flutter/material.dart';

import '../constants.dart';

class MessageWindow extends StatefulWidget {
  const MessageWindow({Key? key}) : super(key: key);

  @override
  State<MessageWindow> createState() => _MessageWindowState();
}

class _MessageWindowState extends State<MessageWindow> {
  void _switchMode() {
    setState(() {
      encryptMode = !encryptMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EncryptedMessage(switchMode: _switchMode),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: DecryptedMessage(switchMode: _switchMode),
        ),
      ],
    );
  }
}

class EncryptedMessage extends StatefulWidget {
  final Function switchMode;

  const EncryptedMessage({Key? key, required this.switchMode})
      : super(key: key);

  @override
  State<EncryptedMessage> createState() => _EncryptedMessageState();
}

class _EncryptedMessageState extends State<EncryptedMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: myBlue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: encryptMode ? myGreen : const Color(0x33bde038),
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              if (!encryptMode) {
                widget.switchMode();
                print(encryptedText);
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
              "Encrypter",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              enabled: encryptMode,
              style: TextStyle(
                fontFamily: "Poppins",
                color: encryptMode ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              cursorColor: myGreen,
              maxLines: 8,
              decoration: InputDecoration(
                fillColor: encryptMode ? Colors.white : myBlue,
                filled: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: myGreen,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DecryptedMessage extends StatefulWidget {
  final Function switchMode;
  const DecryptedMessage({
    Key? key,
    required this.switchMode,
  }) : super(key: key);

  @override
  State<DecryptedMessage> createState() => _DecryptedMessageState();
}

class _DecryptedMessageState extends State<DecryptedMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: myBlue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: !encryptMode ? myGreen : const Color(0x33bde038),
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              if (encryptMode) {
                widget.switchMode();
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
              "Decrypter",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              enabled: !encryptMode,
              style: TextStyle(
                fontFamily: "Poppins",
                color: !encryptMode ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              cursorColor: myGreen,
              maxLines: 8,
              decoration: InputDecoration(
                fillColor: !encryptMode ? Colors.white : myBlue,
                filled: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: myGreen,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
