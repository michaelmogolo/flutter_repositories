import 'package:flutter/material.dart';
import 'package:flutter_repositories/controller/HomeController.dart';
import 'package:flutter_repositories/models/book.dart';

class BookTable extends StatefulWidget {

  final HomeController _homeController;
  final VoidCallback _refreshlist;

  // ignore: use_key_in_widget_constructors
  const BookTable(
    this._homeController,
    this._refreshlist
  );

  @override
  State<BookTable> createState() => _BookTableState();
}

class _BookTableState extends State<BookTable> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future:widget._homeController.getAll(),
      builder: (context, snapshot){

          if(!snapshot.hasData){
            return const Center(child: Text('Loading text'));
          }
          else{

            return DataTable(
                columns: _createBookTableColumns(),
                rows: _createBookTableRows(snapshot.data ?? []));

          }
      }
    );
  }


   List<DataColumn> _createBookTableColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Book')),
      const DataColumn(label: Text('Action')),
    ];
  }

  List<DataRow> _createBookTableRows(List<Book> books) {
    return books
        .map((book) => DataRow(cells: [
              DataCell(Text('#' + book.id.toString())),
              DataCell(Text('${book.name} (${book.years.toString()})')),
              DataCell(IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await widget._homeController.removeBook(book.id);
                  widget._refreshlist();
                },
              )),
            ]))
        .toList();
  }
}

