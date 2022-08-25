import 'package:flutter/material.dart';

class SubButton extends StatelessWidget {
  final Function() buttonFunction;
  final String buttonTitle;
  final double height;
  final IconData icon;
  const SubButton({
    Key? key,
    required this.buttonFunction,
    required this.buttonTitle,
    required this.height,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Text(
              buttonTitle,
              style: TextStyle(fontSize: 18, color: Colors.black),
            )
          ],
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))),
        onPressed: buttonFunction,
      ),
    );
  }
}
