import 'dart:convert';

List<Colheita> colheitaFromJson(String str) =>
    List<Colheita>.from(json.decode(str).map((x) => Colheita.fromMap(x)));

String colheitaToJson(List<Colheita> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Colheita {
  Colheita({
    required this.id,
    required this.idProduto,
    required this.idPreco,
    required this.idProdutor,
    required this.idDistribuidor,
    required this.quantidade,
    required this.dataEHora,
  });

  String id;
  String idProduto;
  String idPreco;
  String idProdutor;
  String idDistribuidor;
  String dataEHora;
  String quantidade;

  factory Colheita.fromMap(Map<String, dynamic> json) => Colheita(
        id: json["id"],
        idProduto: json["idProduto"],
        idPreco: json["idPreco"],
        idProdutor: json["idProdutor"],
        idDistribuidor: json["idDistribuidor"],
        dataEHora: json["dataEHora"],
        quantidade: json["quantidade"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idProduto": idProduto,
        "idPreco": idPreco,
        "idProdutor": idProdutor,
        "idDistribuidor": idDistribuidor,
        "dataEHora": dataEHora,
        "quantidade": quantidade,
      };
}
