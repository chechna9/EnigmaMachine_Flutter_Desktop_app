import 'package:fluent_ui/fluent_ui.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
