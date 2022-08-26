import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final int maxLines;
  final Rx<bool> validator;
  final Rx<String> errmsg;
  final TextInputType textInputType;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.maxLines = 1,
    required this.validator,
    required this.errmsg,
    this.textInputType = TextInputType.text,
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
        child: Obx(() => TextField(
              keyboardType: textInputType,
              controller: textEditingController,
              maxLines: maxLines,
              decoration: InputDecoration(
                errorText: validator.value ? errmsg.value : null,
                hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(20),
              ),
            )),
      ),
    );
  }
}
