import 'package:flutter_repositories/models/book.dart';

abstract class IBookRepository {

  Future<List<Book>> getAll();

  Future<Book?>getOneBook(int id);

  Future<void>storeBook(Book book);

  Future<void>updateBook(Book book);

  Future<void> deleteBook(int id);
}