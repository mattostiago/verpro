import 'package:flutter/material.dart';
import 'package:verpro/database/storage.dart';
import 'package:verpro/screens/adicionar_distribuidor.dart';
import 'package:verpro/screens/adicionar_produto.dart';
import 'package:verpro/src/models/distribuidor.dart';
import 'package:verpro/src/models/produto.dart';

class AdicionarColheita extends StatefulWidget {
  const AdicionarColheita({super.key});

  @override
  State<AdicionarColheita> createState() => _AdicionarColheitaState();
}

class _AdicionarColheitaState extends State<AdicionarColheita> {
  Storage storage = Storage();
  String now = DateTime.now().millisecondsSinceEpoch.toString();

  List<Produto> arrayProdutos = [];
  final precoValueNotifier = ValueNotifier('');
  String produto = "";

  List<Distribuidor> arrayDistribuidor = [];
  final distribuidorValueNotifier = ValueNotifier('');
  String distribuidor = "";

  final precoController = TextEditingController();
  final idProduto = TextEditingController();
  final logoController = TextEditingController();
  bool visible = false;
  bool isDataStorageInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Colheita"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          child: Column(
            children: [
              const Text("Qual é o produto da colheita?"),
              FutureBuilder(
                future: storage.pegarProdutos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      arrayProdutos = produtoFromJson(snapshot.data.toString());
                      return Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(8.0),
                            child: ValueListenableBuilder(
                              valueListenable: precoValueNotifier,
                              builder: (BuildContext context, String value, _) {
                                return DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Produto",
                                    hintText:
                                        "Selecione o produto que deseja mudar o preço",
                                  ),
                                  isExpanded: true,
                                  items: arrayProdutos
                                      .map(
                                        (op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op.nome),
                                        ),
                                      )
                                      .toList(),
                                  value: (value.isEmpty) ? null : value,
                                  onChanged: (escolha) {
                                    escolha as Produto;
                                    produto = escolha.id;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AdicionarProduto(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const LinearProgressIndicator();
                    }
                  }

                  return const CircularProgressIndicator();
                },
              ),
              FutureBuilder(
                future: storage.pegarDistribuidores(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      arrayDistribuidor =
                          distribuidorFromJson(snapshot.data.toString());
                      return Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(8.0),
                            child: ValueListenableBuilder(
                              valueListenable: distribuidorValueNotifier,
                              builder: (BuildContext context, String value, _) {
                                return DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Distribuidor",
                                    hintText:
                                        "Selecione para quem você vende a produção",
                                  ),
                                  isExpanded: true,
                                  items: arrayDistribuidor
                                      .map(
                                        (op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op.nome),
                                        ),
                                      )
                                      .toList(),
                                  value: (value.isEmpty) ? null : value,
                                  onChanged: (escolha) {
                                    escolha as Distribuidor;
                                    distribuidor = escolha.id;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AdicionarDistribuidor(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const LinearProgressIndicator();
                    }
                  }

                  return const CircularProgressIndicator();
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: precoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Preço",
                    hintText: "Informe o novo preço do produto",
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: isDataStorageInProgress
                      ? null
                      : () async {
                          setState(() {
                            isDataStorageInProgress = true;
                          });
                          int sucesso = await storage.inserirPreco(
                            double.parse(precoController.text),
                            produto,
                            distribuidor,
                            now,
                          );
                          sucesso == 1
                              ? Navigator.of(context).pop()
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Erro ao salvar"),
                                      content: const Text(
                                          'Houve um erro ao salvar o distribuidor.'),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                          ;

                          setState(() {
                            isDataStorageInProgress = false;
                          });

                          isDataStorageInProgress = false;
                        },
                  //onPressed: webCall,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: isDataStorageInProgress
                        ? const SizedBox(
                            height: 28,
                            width: 28,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'Incluir',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                  ),
                ),
              ),
              Visibility(
                  visible: visible,
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: const CircularProgressIndicator())),
            ],
          ),
        ),
      )),
    );
  }
}
