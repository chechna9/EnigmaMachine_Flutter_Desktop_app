import 'package:enigma_simulator/components/input.dart';
import 'package:enigma_simulator/components/output.dart';
import 'package:enigma_simulator/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: myGrey,
        child: Column(
          children: const [
            Expanded(
              flex: 2,
              child: Output(),
            ),
            Divider(
              endIndent: 400,
              indent: 400,
              color: myBlue,
            ),
            Expanded(
              child: Input(),
            ),
          ],
        ),
      ),
    );
  }
}
