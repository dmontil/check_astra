class User {
  String userName;
  String token;
  String password;

  User({this.token, this.userName,this.password});

  User.fromJson(Map<String, dynamic> json)
      :
        token = json['token'],
        userName = json['userId'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['userId'] = this.userName;
    data['password'] = this.password;

    return data;
  }

}