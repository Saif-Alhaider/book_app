import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/star_rating.dart';
import 'package:book_app/Reusable_Widgets/title.dart';

import '../Reusable_Widgets/MainButton.dart';
import '../Reusable_Widgets/customTextField.dart';

class AddBookPage extends StatelessWidget {
  const AddBookPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Rx<String> title = Rx<String>("");
    // Rx<String> author = Rx<String>("");
    // Rx<String> description = Rx<String>("");
    // Rx<double> price = Rx<double>(0.0);
    Rx<int> rate = Rx<int>(0);
    // Rx<String> imageLink = Rx<String>("");
    TextEditingController titleTextfields = TextEditingController();
    TextEditingController authorTextfields = TextEditingController();
    TextEditingController imageLinkTextfields = TextEditingController();
    TextEditingController priceTextfields = TextEditingController();
    TextEditingController descriptionTextfields = TextEditingController();

    // String imageLink = "https://api.lorem.space/image/book?w=150&h=224";
    addButton() {
      Books.addToAllBooks(
        Book(
            title: titleTextfields.text,
            author: authorTextfields.text,
            imageLink: imageLinkTextfields.text,
            price: double.parse(priceTextfields.text),
            rate: rate.value.toDouble(),
            description: descriptionTextfields.text),
      );
      FocusScope.of(context).unfocus();
      titleTextfields.clear();
      authorTextfields.clear();
      imageLinkTextfields.clear();
      priceTextfields.clear();
      descriptionTextfields.clear();
      Book lastBook = Books().allBooks[Books().allBooks.length - 1];
      if (kDebugMode) {
        print(
            "title:${lastBook.title}\nauthor:${lastBook.author}\ndescription:${lastBook.description}\nprice:\$${lastBook.price}\nrate:${lastBook.rate}");
      }
    }

    return SingleChildScrollView(
      child: Container(
        height: 800,
        width: double.maxFinite,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CustomTitle(title: "Add Book"),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  children: [
                    CustomTextField(
                        hintText: "Book's Name",
                        textEditingController: titleTextfields),
                    CustomTextField(
                        hintText: "Author's Name",
                        textEditingController: authorTextfields),
                    CustomTextField(
                        hintText: "Price",
                        maxLines: 1,
                        textEditingController: priceTextfields),
                    CustomTextField(
                        hintText: "Image Link",
                        maxLines: 1,
                        textEditingController: imageLinkTextfields),
                    CustomTextField(
                        hintText: "Description",
                        maxLines: 5,
                        textEditingController: descriptionTextfields),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: StarRating(rate: rate)),

                    // -----------------------
                    MainButton(
                      buttonFunction: addButton,
                      buttonTitle: "Add",
                    ),
                  ],
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
