class Book {
  final String title;
  final String author;
  final String description;
  final String imageLink;
  final bool isSaved;
  Book({
    required this.title,
    required this.author,
    this.description = "",
    required this.imageLink,
    this.isSaved = false,
  });
}

class Books {
  // ignore: prefer_final_fields
  static List<Book> _allBooks = [
    Book(
      title: "pestashiu theory",
      author: "saif",
      imageLink: "https://api.lorem.space/image/book?w=150&h=220",
    ),
    Book(
      title: "Game of Thrones",
      author: "saif",
      imageLink: "https://api.lorem.space/image/book?w=150&h=220",
      isSaved: true
    ),
    Book(
      title: "brothers of karmasov",
      author: "saif",
      imageLink: "https://api.lorem.space/image/book?w=150&h=220",
      isSaved: true
    )
  ];
  
  List<Book> _savedBooks = [];

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
    return _savedBooks;
  }
}
// void main(List<String> args) {
//   books library = books();

//   print(library.savedBooks);
// }
