import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Add Book/add_book_page.dart';
import 'Books/Books_Page.dart';
import 'cart/cart_main.dart';
import 'saved books/saved_books_main.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List pages = [BooksPage(), Cart(), SavedBooksMain(), AddBookPage()];

  @override
  Widget build(BuildContext context) {
    Rx<int> index = Rx<int>(0);
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Obx(() => pages[index.value]),
                // pages[3],
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Obx(() {
                        return BottomNavigationBar(
                          currentIndex: index.value,
                          onTap: (currentIndex) {
                            index.value = currentIndex;
                          },
                          type: BottomNavigationBarType.fixed,
                          selectedItemColor: Colors.black,
                          unselectedItemColor: Colors.grey,
                          backgroundColor: Colors.white,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          items:  [
                            BottomNavigationBarItem(
                              icon: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(
                                  Icons.home_outlined,
                                  size: 30,
                                ),
                              ),
                              label: "Home",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              ),
                              label: "Cart",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(
                                Icons.bookmark_border,
                                size: 30,
                              ),
                              label: "Saved Books",
                            ),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                label: "Add Book"),
                          ],
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
