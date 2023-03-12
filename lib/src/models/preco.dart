import 'dart:convert';

List<Preco> precoFromJson(String str) =>
    List<Preco>.from(json.decode(str).map((x) => Preco.fromMap(x)));

String precoToJson(List<Preco> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Preco {
  Preco(
      {required this.id,
      required this.preco,
      required this.idProduto,
      required this.idDistribuidor,
      required this.dataInicio});

  String id;
  String preco;
  String idProduto;
  String idDistribuidor;
  String dataInicio;

  factory Preco.fromMap(Map<String, dynamic> json) => Preco(
        id: json["id"],
        preco: json["preco"],
        idProduto: json["idProduto"],
        idDistribuidor: json["idDistribuidor"],
        dataInicio: json["dataInicio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "preco": preco,
        "idProduto": idProduto,
        "idDistribuidor": idDistribuidor,
        "dataInicio": dataInicio,
      };
}
