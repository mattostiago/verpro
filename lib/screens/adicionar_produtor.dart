import 'package:flutter/material.dart';
import 'package:verpro/database/storage.dart';

class AdicionarProdutor extends StatefulWidget {
  const AdicionarProdutor({super.key});

  @override
  State<AdicionarProdutor> createState() => _AdicionarProdutorState();
}

class _AdicionarProdutorState extends State<AdicionarProdutor> {
  Storage storage = Storage();
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  final fotoController = TextEditingController();
  bool visible = false;
  bool isDataStorageInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Produtor Rural"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          width: 400,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome",
                    hintText: "Informe o nome do produtor",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: descricaoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Descrição",
                    hintText: "descricao",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: fotoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Foto",
                    hintText: "URL foto",
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
                          int sucesso = await storage.inserirProdutor(
                              nomeController.text,
                              descricaoController.text,
                              fotoController.text);
                          sucesso == 1
                              ? Navigator.of(context).pop()
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Erro ao salvar"),
                                      content: const Text(
                                          'Houve um erro ao salvar o produtor rural.'),
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
