class LoginResponse {
  List<UserLoginData>? result;

  LoginResponse({this.result});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <UserLoginData>[];
      json['result'].forEach((v) {
        result!.add(UserLoginData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserLoginData {
  String? id;
  String? fname;
  String? lname;
  String? username;
  String? email;
  String? mobile;
  String? success;

  UserLoginData(
      {this.id,
        this.fname,
        this.lname,
        this.username,
        this.email,
        this.mobile,
        this.success});

  UserLoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fname'] = fname;
    data['lname'] = lname;
    data['username'] = username;
    data['email'] = email;
    data['mobile'] = mobile;
    data['success'] = success;
    return data;
  }
}