import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_repositories/controller/HomeController.dart';
import 'package:flutter_repositories/models/book.dart';

class FormData extends StatefulWidget {

  final HomeController _homeController;
  final VoidCallback _refreshlist;

  // ignore: use_key_in_widget_constructors
  const FormData(this._homeController, this._refreshlist);
  
  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              child: TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter book title';
                }
                return null;
              },
            ),
            ),
            TextFormField(
              controller: _yearController,
              decoration: const InputDecoration(
                labelText: 'Year',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d]')),
              ],
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter released year';
                }
                return null;
              },
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {

                        Book book = Book(
                          id: 0, 
                          name: _titleController.text,
                          years: _yearController.text
                        );

                        await widget._homeController.store(book);

                        _titleController.clear();
                      _yearController.clear();
                      widget._refreshlist();
                    }
                  },
                  child: const Text('Add book'),
                )),
          ],
        ),
      ),
    );
  }
}