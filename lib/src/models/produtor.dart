import 'dart:convert';

List<Produtor> dispositivoFromJson(String str) =>
    List<Produtor>.from(json.decode(str).map((x) => Produtor.fromMap(x)));

String produtorToJson(List<Produtor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produtor {
  Produtor({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.foto,
  });

  String id;
  String nome;
  String descricao;
  String foto;

  factory Produtor.fromMap(Map<String, dynamic> json) => Produtor(
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