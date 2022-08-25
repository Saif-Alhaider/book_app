class Book {
  final String title;
  final String author;
  final String description;
  final String imageLink;
  final double price;
  final double rate;
  bool isSaved;
  bool isCart;
  Book({
    required this.title,
    required this.author,
    this.description = "",
    required this.imageLink,
    required this.price,
    required this.rate,
    this.isSaved = false,
    this.isCart = false,
  });
}

class Books {
  // ignore: prefer_final_fields
  static List<Book> _allBooks = [
    Book(
      title: "Yves Saint Laurent",
      author: "saif",
      imageLink:
          "https://images-na.ssl-images-amazon.com/images/I/31zSzxEMQ8L._SX340_BO1,204,203,200_.jpg",
      price: 4.9,
      rate: 5,
    ),
    Book(
        title: "Game of Thrones",
        author: "saif",
        imageLink:
            "https://upload.wikimedia.org/wikipedia/en/d/dc/A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg",
        price: 14.9,
        rate: 3),
    Book(
        title: "brothers of karmasov",
        author: "saif",
        imageLink: "https://kbimages1-a.akamaihd.net/561f9624-ba0a-43dc-a569-dac6327e3804/1200/1200/False/the-brothers-karamazov-233.jpg",
        price: 8.0,
        rate: 1)
  ];

  List<Book> _savedBooks = [];
  List<Book> _cartBooks = [];

  static void addToAllBooks(Book book) {
    _allBooks.add(book);
    print(_allBooks.length);
  }

  List<Book> get allBooks => _allBooks;

  get savedBooks {
    // print(_allBooks[0].isSaved);
    for (Book element in _allBooks) {
      if (element.isSaved == true) {
        _savedBooks.add(element);
      }
    }
    return _savedBooks;
  }

  get cartBooks {
    for (Book element in _allBooks) {
      if (element.isCart == true) {
        _cartBooks.addAll([element]);
      }
    }
    return _cartBooks;
  }
}

// void main(List<String> args) {
//   books library = books();

//   print(library.savedBooks);
// }
