import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:verpro/utils/propriedades.dart';

class Storage {
  DateTime now = DateTime.now();

  Future inserirProduto(String nome, String descricao, String foto) async {
    int sucesso = 0;
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiVerpro/inserirProduto.php',
      // fragment: 'numbers');
    );
    // Store all data with Param Name.
    var data = {'nome': nome, 'descricao': descricao, 'foto': foto};
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("produto adicionado com sucesso");
    }
    return sucesso;
  }

  Future inserirProdutor(String nome, String descricao, String foto) async {
    int sucesso = 0;
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiVerpro/inserirProdutor.php',
      // fragment: 'numbers');
    );
    // Store all data with Param Name.
    var data = {'nome': nome, 'descricao': descricao, 'foto': foto};
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("produtor adicionado com sucesso");
    }
    return sucesso;
  }

  Future inserirDistribuidor(String nome, String descricao, String logo) async {
    int sucesso = 0;
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiVerpro/inserirDistribuidor.php',
      // fragment: 'numbers');
    );
    // Store all data with Param Name.
    var data = {'nome': nome, 'descricao': descricao, 'logo': logo};
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("distribuidor adicionado com sucesso");
    }
    return sucesso;
  }

  Future inserirPreco(double preco, String idProduto, String idDistribuidor,
      String dataInicio) async {
    int sucesso = 0;
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiVerpro/inserirPreco.php',
      // fragment: 'numbers');
    );
    // Store all data with Param Name.
    var data = {
      'preco': preco,
      'idProduto': idProduto,
      'idDistribuidor': idDistribuidor,
      'dataInicio': dataInicio
    };
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("preco adicionado com sucesso");
    }
    return sucesso;
  }

  Future inserirColheita(String idProduto, String idPreco, String idProdutor,
      String idDistribuidor, String quantidade, String dataEHora) async {
    int sucesso = 0;
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiVerpro/inserirColheita.php',
      // fragment: 'numbers');
    );
    // Store all data with Param Name.
    var data = {
      'idProduto': idProduto,
      'idPreco': idPreco,
      'idProdutor': idProdutor,
      'idDistribuidor': idDistribuidor,
      'dataEHora': dataEHora,
      'quantidade': quantidade,
    };
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("colheita adicionada com sucesso");
    }
    return sucesso;
  }

  Future pegarProdutos() async {
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiVerpro/pegarProdutos.php',
      // fragment: 'numbers');
    );
    final response = await http.get(url);
    return response.body;
  }

  Future pegarDistribuidores() async {
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiVerpro/pegarDistribuidor.php',
      // fragment: 'numbers');
    );
    final response = await http.get(url);
    return response.body;
  }
  /////API PIN////

  pegarSituacaoAtual(String idDispositivo) async {
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/statusAtualDispositivo.php',
      // fragment: 'numbers');
    );

    // Store all data with Param Name.
    var data = {'idDispositivo': idDispositivo};
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);
    print(response.body);
    print(response.headers);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      print("Dado recebido");
    }

    return response.body;
  }

  Future pegarTodasAsSituacoes() async {
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/recebeSituacao.php',
      // fragment: 'numbers');
    );
    final response = await http.get(url);
    return response.body;
  }

  Future pegarTabelaSituacaoAtual() async {
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/recebeTabelaStatusAtualDisp.php',
      // fragment: 'numbers');
    );
    final response = await http.get(url);
    return response.body;
  }

  Future pegarTiposDispositivos() async {
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/recebeTipoDispositivo.php',
      // fragment: 'numbers');
    );
    final response = await http.get(url);
    return response.body;
  }

  Future pegarVelocidadeInternetRecente() async {
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/recebeVelocidadeRecente.php',
      // fragment: 'numbers');
    );
    final response = await http.get(url);
    return response.body;
  }

  Future pegarNivelRecenteReservatorio() async {
    //teste a ser alterado
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/consultarUltimoNivelReservatorio.php',
      // fragment: 'numbers');
    );
    final response = await http.get(url);
    return response.body;
  }

  Future<String> desativarDispositivoBd(
      String idDispositivo, String dispAtivo) async {
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/desativarDispositivo.php',
    );

    var data = {
      'idDispositivo': idDispositivo,
      'dispAtivo': dispAtivo,
    };

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      return "O dispositivo foi desativado com sucesso.";
    } else {
      return "Houve uma falha no processo de desativação do dispositivo. Resposta: " +
          response.toString();
    }
  }

  Future adicionarDispositivo(String nomeDispositivo, String ipDispositivo,
      String tipoDispositivo) async {
    int sucesso = 0;
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/salvarDispositivos.php',
      // fragment: 'numbers');
    );

    // Store all data with Param Name.
    var data = {
      'nomeDispositivo': nomeDispositivo,
      'ipDispositivo': ipDispositivo,
      'tipoDispositivo': tipoDispositivo
    };
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("adicionado com sucesso");
    }
    return sucesso;
  }

  Future adicionarNovoTanque(
      String nome, String capacidade, String altura, String largura) async {
    int sucesso = 0;
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/adicionarNovoTanque.php',
      // fragment: 'numbers');
    );

    // Store all data with Param Name.
    var data = {
      'nome': nome,
      'capacidade': capacidade,
      'altura': altura,
      'largura': largura,
    };
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("Tanque adicionado com sucesso");
    }
    return sucesso;
  }

  Future adicionarTipoDeDispositivo(String nomeTipoDispositivo) async {
    int sucesso = 0;

    print("Estou no add tipo");

    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/adicionarTipoDispositivo.php',
      // fragment: 'numbers');
    );

    // Store all data with Param Name.
    var data = {'nomeTipoDispositivo': nomeTipoDispositivo};
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      sucesso = 1;
      print("adicionado com sucesso");
    }
    return sucesso;
  }

  Future salvarVelocidadeInternet(
      double downloadTaxa,
      double uploadTaxa,
      String downloadUn,
      String uploadUn,
      String dataEHora,
      String organizacao) async {
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/salvarVelocidadeInternet.php',
      // fragment: 'numbers');
    );

    // Store all data with Param Name.
    var data = {
      'idVelocidadeInternet': '',
      'downloadTaxa': downloadTaxa,
      'uploadTaxa': uploadTaxa,
      'downloadUn': downloadUn,
      'uploadUn': uploadUn,
      'dataEHora': dataEHora,
      'organizacao': organizacao
    };
    print(data);

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));
    print(response.request);

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      print("adicionado com sucesso");
    }
  }

  Future webCallSituacao(
      String idDispositivo, String dataEHora, String statusConexao) async {
    // API URL
    Uri url = Uri(
      scheme: schemePropriedades,
      host: hostPropriedades,
      path: '/apiPin/salvarSituacao.php',
      // fragment: 'numbers');
    );

    // Store all data with Param Name.
    var data = {
      'idDispositivo': idDispositivo,
      'dataEHora': dataEHora,
      "statusConexao": statusConexao
    };

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {}
  }
}
