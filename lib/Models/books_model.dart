class Book {
  final String title;
  final String author;
  final String description;
  final String imageLink;
  final double price;
  final double rate;
  bool isSaved;
  final bool isCart;
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
      imageLink: "https://api.lorem.space/image/book?w=150&h=220",
      price: 4.9,
      rate: 5,
    ),
    Book(
      title: "Game of Thrones",
      author: "saif",
      imageLink: "https://api.lorem.space/image/book?w=150&h=220",
      price: 14.9,
      rate: 3
    ),
    Book(
      title: "brothers of karmasov",
      author: "saif",
      imageLink: "https://api.lorem.space/image/book?w=150&h=220",
      price: 8.0,
      rate: 1
    )
  ];
  
  List<Book> _savedBooks = [];
  List<Book> _cartBooks = [];

static void addToAllBooks(Book book){
  _allBooks.add(book);
  print(_allBooks.length);
}
get allBooks => _allBooks;


get savedBooks {
      // print(_allBooks[0].isSaved);
    for (Book element in _allBooks) {
      if (element.isSaved == true) {
        _savedBooks.addAll([element]);
      }
    }
    print(_savedBooks);
    return _savedBooks;
  }
  get cartBooks{
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
