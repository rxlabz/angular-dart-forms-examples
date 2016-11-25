class User {
  String name;
  int age;
  int genre;
  bool newsletter;

  User({
      this.name: "",
      this.age: 0,
      this.genre: 1,
      this.newsletter: false});

  @override
  String toString() {
    return '''
User{
  String name : $name
  int age : $age
  int genre : $genre
  bool newsletter : $newsletter
}''';
  }

}
