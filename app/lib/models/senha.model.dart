class SenhaModel {
  String site;
  String login;
  String senha;

  SenhaModel({this.site, this.login, this.senha});

  SenhaModel.fromJson(Map<String, dynamic> json) {
    site = json['site'];
    login = json['login'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site'] = this.site;
    data['login'] = this.login;
    data['senha'] = this.senha;
    return data;
  }
}
