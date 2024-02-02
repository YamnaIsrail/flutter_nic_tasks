class SqlModel{
  final int? id;
  final String title;
  final int age;
  final String description;

  SqlModel({this.id, required this.title, required this.age, required this.description});

  SqlModel.fromMap(Map<String, dynamic> res):
        id= res['id'],
        title= res['title'],
        age= res['age'],
        description= res['description'];

  Map<String, Object?> toMap(){
    return{
      'id' : id,
      'title': title,
      'age': age,
      'description': description
    };
  }


}