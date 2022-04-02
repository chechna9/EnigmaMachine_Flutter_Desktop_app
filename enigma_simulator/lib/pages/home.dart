import 'package:enigma_simulator/components/input.dart';
import 'package:enigma_simulator/components/output.dart';
import 'package:enigma_simulator/constants.dart';
import 'package:enigma_simulator/controllers/main_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MainRouter mR = Provider.of<MainRouter>(context);
    return Material(
      child: Container(
        color: myGrey,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Output(
                mR: mR,
              ),
            ),
            const Divider(
              endIndent: 400,
              indent: 400,
              color: myBlue,
            ),
            Expanded(
              child: Input(
                mR: mR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
