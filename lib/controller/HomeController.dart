import 'package:flutter_repositories/models/book.dart';
import 'package:flutter_repositories/db/virtual_db.dart';
import 'package:flutter_repositories/repositories/BookRepository.dart';


class HomeController{

  final BookRepository _bookRepository =  BookRepository(VirtualBD());

  Future<List<Book>> getAll() async{

    return _bookRepository.getAll();
  }

  Future<void> addBook(Book book) async {

    return _bookRepository.storeBook(book);

  }

  Future<void> removeBook(int id) async {

    return _bookRepository.deleteBook(id);

  }
}