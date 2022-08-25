import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String hintText;
  final int maxLines;
  final Rx<String> obj;
  CustomTextField({
    Key? key,
    required this.hintText,
    this.maxLines = 1,
    required this.obj,
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
          controller: _textEditingController,
          onChanged: (textValue) {
            obj.value = textValue;
            // print(obj);
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
