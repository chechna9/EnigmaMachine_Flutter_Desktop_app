import 'package:enigma_simulator/controllers/main_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/messageProvider.dart';
import '../constants.dart';

class MessageWindow extends StatefulWidget {
  final MainRouter mR;
  const MessageWindow({Key? key, required this.mR}) : super(key: key);

  @override
  State<MessageWindow> createState() => _MessageWindowState();
}

class _MessageWindowState extends State<MessageWindow>
    with SingleTickerProviderStateMixin {
  final encryptController = TextEditingController();
  final decrypytConroller = TextEditingController();
  AnimationController? _animationController;
  Animation<double>? _animation;
  void _switchMode() {
    setState(() {
      encryptMode = !encryptMode;
      firstOperation = true;
      Provider.of<Messages>(context, listen: false).resetEncrypt();
      Provider.of<Messages>(context, listen: false).resetDecrypt();
      encryptController.clear();
      decrypytConroller.clear();
      widget.mR.reset();
      widget.mR.config();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    final _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInExpo,
      reverseCurve: Curves.easeIn, //easinOut
    );
    _animationController!.forward();
    _animation = Tween<double>(begin: 0.7, end: 0.8).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController!.forward();
        }
      });
  }

  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EncryptedMessage(
            switchMode: _switchMode,
            controller: decrypytConroller,
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        Transform.rotate(
          angle: !encryptMode ? 0 : 3.14,
          child: Transform.scale(
            scale: _animation!.value,
            child: Image.asset(
              'assets/images/logoLowDim.png',
              height: 80,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
          child: DecryptedMessage(
            switchMode: _switchMode,
            controller: encryptController,
          ),
        ),
      ],
    );
  }
}

class EncryptedMessage extends StatefulWidget {
  final Function switchMode;
  final TextEditingController controller;

  const EncryptedMessage(
      {Key? key, required this.switchMode, required this.controller})
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
              controller: widget.controller,
              onChanged: (e) {
                Provider.of<Messages>(context, listen: false).resetDecrypt();
                Provider.of<Messages>(context, listen: false)
                    .addToDecrypt(widget.controller.text);
              },
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
                hintText: Provider.of<Messages>(context).decryptedText,
                hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: encryptMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
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
  final TextEditingController controller;
  const DecryptedMessage(
      {Key? key, required this.switchMode, required this.controller})
      : super(key: key);

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
              controller: widget.controller,
              onChanged: (e) {
                Provider.of<Messages>(context, listen: false).resetEncrypt();
                Provider.of<Messages>(context, listen: false)
                    .addToEncrypt(widget.controller.text);
              },
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
                hintText: Provider.of<Messages>(context).encryptedText,
                hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: !encryptMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
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
