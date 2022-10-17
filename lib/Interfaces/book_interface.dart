import 'package:flutter_repositories/models/book.dart';

abstract class IBookRepository {

  Future<List<Book>> getAll();

  Future<Book?>getById(int id);

  Future<void>store(Book book);

  Future<void>update(Book book);

  Future<void> delete(int id);
}