import 'package:flutter_repositories/models/book.dart';
import 'package:flutter_repositories/db/virtual_db.dart';
import 'package:flutter_repositories/repositories/BookRepository.dart';


class HomeController{

  final BookRepository _bookRepository =  BookRepository(VirtualBD());

  Future<List<Book>> index() async{

    return _bookRepository.getAll();
  }

  Future<void> store(Book book) async {

    return _bookRepository.store(book);

  }

  Future<void> delete(int id) async {

    return _bookRepository.delete(id);

  }
}