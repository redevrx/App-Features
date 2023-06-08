class SingUpData {
  String email;
  String password;
  String username;

  SingUpData({this.email = "", this.password = "", this.username = ""});

  bool isNull(){
    return email.isEmpty || password.isEmpty || username.isEmpty;
  }
}
