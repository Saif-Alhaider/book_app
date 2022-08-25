import 'package:flutter/material.dart';
class MainButton extends StatelessWidget {
  
  final Function() buttonFunction;
  final String buttonTitle;
  const MainButton({
    Key? key,
    required this.buttonFunction,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 65,
      child: ElevatedButton(
        child: Text(buttonTitle.toUpperCase(), style: TextStyle(fontSize: 14)),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(Color.fromRGBO(6, 7, 13, 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))),
        onPressed: buttonFunction,
      ),
    );
  }
}
