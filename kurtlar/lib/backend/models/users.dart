class users {
  String? entryCode;
  String? password;
  String? username;

  users({this.entryCode, this.password, this.username});

  users.fromJson(Map<String, dynamic> json) {
    entryCode = json['entryCode'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entryCode'] = this.entryCode;
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}