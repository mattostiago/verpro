import 'package:floor/floor.dart';
import 'package:verpro/src/entity_base.dart';

@Entity(tableName: "Produtos")
class ProdutoEntity extends EntityBase {
  ProdutoEntity(
      {required int id,
      required String createdAt,
      required String updateAt,
      required this.nome,
      required this.descricao,
      required this.foto})
      : super(id, createdAt, updateAt);
  final String nome;
  final String descricao;
  final String foto;

  /*
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
  */
}
