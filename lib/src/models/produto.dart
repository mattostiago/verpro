class Produto {
  Produto(this.id, this.nome, this.descricao, this.foto);
  late final int id;
  late final String nome;
  late final String descricao;
  late final String foto;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'foto': foto,
    };
    return map;
  }

  Produto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    descricao = map['descricao'];
    foto = map['foto'];
  }
}
