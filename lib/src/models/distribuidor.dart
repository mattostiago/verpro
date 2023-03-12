import 'dart:convert';

List<Distribuidor> distribuidorFromJson(String str) => List<Distribuidor>.from(
    json.decode(str).map((x) => Distribuidor.fromMap(x)));

String distribuidorToJson(List<Distribuidor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Distribuidor {
  Distribuidor({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.logo,
  });

  String id;
  String nome;
  String? descricao;
  String? logo;

  factory Distribuidor.fromMap(Map<String, dynamic> json) => Distribuidor(
        id: json["id"],
        nome: json["nome"],
        descricao: json["descricao"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "logo": logo,
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