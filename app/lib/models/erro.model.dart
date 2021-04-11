class ErroModel {
  int codigo;
  String descricao;

  ErroModel({this.codigo, this.descricao});

  ErroModel.fromJson(Map<String, dynamic> json) {
    codigo = json['Codigo'];
    descricao = json['Descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Codigo'] = this.codigo;
    data['Descricao'] = this.descricao;
    return data;
  }
}
