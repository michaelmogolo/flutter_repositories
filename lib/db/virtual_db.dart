import 'dart:math';
class VirtualBD {

  List<Map<String, dynamic>> _items = [];

  static final VirtualBD _db = VirtualBD._privateConstructor();

  VirtualBD._privateConstructor();

  factory VirtualBD(){
    return _db;
  }

  Future<void> save(Map<String, dynamic> item)async {

      item['id'] = Random().nextInt(1000);

      _items.add(item);
  }

  Future<void>delete(int id)  async {

    _items.removeWhere((item) => item['id'] == id);
  }

  Future<void>update(Map<String, dynamic> data) async {

    int i = _items.indexWhere((element) => element['id'] == data['id']);

    _items[i]= data;
  }

  Future<List<Map<String, dynamic>>> list() async{

    await Future.delayed(const Duration(milliseconds: 800));

    return _items;
  }

  Future<Map<String, dynamic>?> findOne(int id) async {
    return _items.firstWhere((item) => item['id'] == id);
  }
}