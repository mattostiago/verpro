import 'dart:convert';

List<Produto> produtoFromJson(String str) =>
    List<Produto>.from(json.decode(str).map((x) => Produto.fromMap(x)));

String produtoToJson(List<Produto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produto {
  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.foto,
  });

  String id;
  String nome;
  String? descricao;
  String? foto;

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
        id: json["id"],
        nome: json["nome"],
        descricao: json["descricao"],
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "foto": foto,
      };
}

/*
class Dispositivo {
  final String nome;
  final String tipo;
  final String ip;
  final String id;

  Dispositivo(
      {required this.nome,
      required this.tipo,
      required this.ip,
      required this.id});

  Dispositivo.fromMap(Map snapshot)
      : nome = snapshot['nome'] ?? "",
        tipo = snapshot['tipo'] ?? "",
        ip = snapshot['ip'] ?? "",
        id = snapshot['id'];

  toJson() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'ip': ip,
    };
  }
}
*/