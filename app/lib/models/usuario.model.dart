class UsuarioModel {
  String nome;
  String email;

  UsuarioModel({this.nome, this.email});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    if (json['nome'] == '' || json['email'] == '') return;

    nome = json['nome'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    return data;
  }
}
