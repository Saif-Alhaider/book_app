import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final int maxLines;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: textEditingController,
          onChanged: (textValue) {
            // double.tryParse(textValue) == null
            //     ? obj.value = textValue
            //     : obj.value = double.tryParse(textValue);

            // print(obj);
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            hintStyle:  const TextStyle(fontSize: 17, color: Colors.grey),
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
