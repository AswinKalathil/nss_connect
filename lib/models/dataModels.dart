List<User> POUserData = [
  User("username", "123456"),
  User("u", "1"),
  User("aswin", "password"),
];
List<User> VOLUserData = [
  User("username", "123456"),
  User("u", "1"),
  User("haritha", "password"),
  User("bazed", "password"),
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
