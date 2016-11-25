class User {
  int id;
  String name;
  int age;
  int genre;
  bool newsletter;

  User(
      {this.id: 1,
      this.name: "",
      this.age: 0,
      this.genre: 1,
      this.newsletter: false});

  @override
  String toString() {
    return '''
User{
  int id : $id
  String name : $name
  int age : $age
  int genre : $genre
  bool newsletter : $newsletter
}''';
  }

//DateTime birthday;
}
