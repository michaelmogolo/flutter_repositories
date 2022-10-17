import 'package:flutter_repositories/db/virtual_db.dart';
import 'package:flutter_repositories/Interfaces/book_interface.dart';
import 'package:flutter_repositories/models/book.dart';

class BookRepository implements IBookRepository{


  final VirtualBD _db;

  BookRepository(this._db);

  @override
  Future<List<Book>> getAll() async{
    
    var items = await _db.list();

    return items.map((el)=> Book.fromMap(el)).toList();

  }

  @override
  Future<Book?> getById(int id) async{

    var items = await _db.findOne(id);

    return items != null ? Book.fromMap(items) : null;
    
  }

  @override
  Future<void> store(Book book) async{

    await _db.save(book.toJson());

  }

  @override
  Future<void> update(Book book) async{

    await _db.update(book.toJson());

  }

  @override
  Future<void> delete(int id) async{

    await _db.delete(id);

  }


}
