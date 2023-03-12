import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:verpro/database/script.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Future<List<Map<String, dynamic>>> _buscarProdutos() async {
  String path = join(await getDatabasesPath(), 'banco');
  Database db = await openDatabase(path, version: 1, onCreate: (db, v) {
    db.execute(createTable);
    //  db.execute(insert);
    db.execute(insert2);
  });
  return db.query("produto");
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VERPRO"),
      ),
      body: Center(
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
        ),
      ),
    );
  }
}
