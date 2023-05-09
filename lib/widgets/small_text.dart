import 'package:flutter/cupertino.dart';

class Smalltext extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  Smalltext({Key? key, this.color = const Color(0xFF89dad0), required this.text,
    this.size=12,
    this.height=1.2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
        height: height

      ),

    );
  }
}
