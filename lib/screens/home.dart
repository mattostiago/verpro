import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:verpro/database/script.dart';
import 'package:verpro/screens/adicionar_colheita.dart';
import 'package:verpro/screens/adicionar_distribuidor.dart';
import 'package:verpro/screens/adicionar_preco.dart';
import 'package:verpro/screens/adicionar_produto.dart';
import 'package:verpro/screens/adicionar_produtor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VERPRO"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AdicionarColheita(),
            ),
          );
        },
        label: Row(
          children: const [Icon(Icons.add), Text("Adicionar Colheita")],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdicionarProduto(),
                ),
              );
            },
            child: const Text("Adicionar Produto"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdicionarProdutor(),
                ),
              );
            },
            child: const Text("Adicionar Produtor"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdicionarDistribuidor(),
                ),
              );
            },
            child: const Text("Adicionar Distribuidor"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdicionarPreco(),
                ),
              );
            },
            child: const Text("Adicionar Preço"),
          ),
        ],
      )
          /*
        child: FutureBuilder(
          future: _buscarProdutos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var lista = snapshot.data;
              return ListView.builder(
                  itemCount: lista!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(lista[index]['nome']),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),*/
          ),
    );
  }
}
