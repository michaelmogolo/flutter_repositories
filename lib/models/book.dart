
class Book {
  
  final int id;
  final String name;
  final String years;

  Book( {
    required this.id,
    required this.name, 
    required this.years
  });

  
  Book.fromMap(Map<String, dynamic> data):
  id = data['id'],
  name = data['name'],
  years = data['years'];

  Map<String, dynamic> toJson(){

    return{
      'id' : id,
      'name' : name,
      'years' : years
    };
  }

}