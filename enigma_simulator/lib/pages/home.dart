import 'package:enigma_simulator/components/input.dart';
import 'package:enigma_simulator/components/output.dart';
import 'package:fluent_ui/fluent_ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Output(),
        ),
        Expanded(
          child: Input(),
        ),
      ],
    );
  }
}
