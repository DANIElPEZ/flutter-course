class Recipe {
  int id;
  String name;
  String author;
  String img;
  String description;

  Recipe({required this.id,
    required this.name,
    required this.author,
    required this.img,
    required this.description});

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
        name: json['name'],
        author: json['author'],
        img: json['img'],
        description: json['description']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'author':author,
      'img':img,
      'description':description
    };
  }

  //debug
  @override
  String toStr() {
    return 'Name:${name}, author:${author}, img:${img}, description${description}';
  }
}