List<User> POUserData = [
  User("username", "123456"),
  User("u", "1"),
  User("aswin", "password"),
];
List<User> VOLUserData = [
  User("Haritha", "password"),
  User("Bazed", "password"),
  User("Ajith", "password"),
  User("Aksshay", "password"),
  User("Aakash", "password"),
  User("Gokul", "password"),
];
List<User> SECUserData = [
  User("u", "1"),
  User("username", "123456"),
  User("thoukheer", "password")
];

class User {
  String userName;
  String password;
  User(this.userName, this.password) {}
}
