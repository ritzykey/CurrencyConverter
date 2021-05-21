import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  late String text2;

  Function btnPress;

  MyTextButton(this.text2, this.btnPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.2,
      height: MediaQuery.of(context).size.height / 9,
      child: TextButton(
        onPressed: () => btnPress(),
        child: Text(
          this.text2,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
