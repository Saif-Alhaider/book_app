import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Reusable_Widgets/MainButton.dart';
import '../Reusable_Widgets/customTextField.dart';
import 'package:get/get.dart';

class AddBookPage extends StatelessWidget {
  const AddBookPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Rx<String> title = Rx<String>("");
    Rx<String> author = Rx<String>("");
    Rx<String> description = Rx<String>("");
    String imageLink = "https://api.lorem.space/image/book?w=150&h=224";
    addButton() {
      Books.addToAllBooks(
        Book(title: title.value, author: author.value, imageLink: imageLink),
      );
      for (var element in Books().allBooks) {
        print(
            "title:${element.title}\nauthor:${element.author}\ndescription:${element.description}");
        print("-" * 20);
      }
    }

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        CustomTitle(title: "Add Book"),
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                CustomTextField(hintText: "Book's Name", obj: title),
                CustomTextField(hintText: "Author's Name", obj: author),
                CustomTextField(
                    hintText: "Price", maxLines: 1, obj: description),
                CustomTextField(
                    hintText: "Image Link", maxLines: 1, obj: description),
                CustomTextField(
                    hintText: "Description", maxLines: 5, obj: description),
                // -----------------------
                MainButton(buttonFunction: addButton,buttonTitle: "Add",)
              ],
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}
