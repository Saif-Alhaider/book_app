import 'package:flutter/material.dart';

class SubButton extends StatelessWidget {
  final Function() buttonFunction;
  final String buttonTitle;
  final double width;
  final double height;
  const SubButton({
    Key? key,
    required this.buttonFunction,
    required this.buttonTitle,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        child: Text(buttonTitle.toUpperCase(), style: TextStyle(fontSize: 14,color: Colors.black)),
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
