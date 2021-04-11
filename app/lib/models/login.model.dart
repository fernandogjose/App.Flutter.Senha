class LoginModel {
  String email;
  String senha;

  LoginModel({this.email, this.senha});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    senha = json['Senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['Senha'] = this.senha;
    return data;
  }
}
