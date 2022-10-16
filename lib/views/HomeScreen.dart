
import 'package:flutter/material.dart';
import 'package:flutter_repositories/controller/HomeController.dart';
import 'package:flutter_repositories/views/includes/BookTable.dart';
import 'package:flutter_repositories/views/includes/FormData.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _refreshList() {
    setState(() {});
  }

  final HomeController _homeController =  HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(children: [
          FormData(_homeController, _refreshList),
        BookTable(_homeController, _refreshList)
      ]),
    );
  }
}