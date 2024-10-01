import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação bancária',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Transferencia {
  String conta;
  double valor;

  Transferencia(this.conta, this.valor);
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _ContaController = TextEditingController();
  final TextEditingController _ValorController = TextEditingController();

  List<Transferencia> lista = [];

  void transferir(String conta, double valor) {
    Transferencia transferencia = Transferencia(conta, valor);
    setState(() {
      lista.add(transferencia);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplicação bancária',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 140, 79),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _ContaController,
              decoration: InputDecoration(hintText: "Conta"),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _ValorController,
              decoration: InputDecoration(hintText: "Valor"),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                transferir(
                    _ContaController.text, double.parse(_ValorController.text));
                _ContaController.clear();
                _ValorController.clear();
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 255, 8))),
                child: const Text("Transferir"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          textDirection: TextDirection.ltr,
                          children: [
                            Text(
                              "Tranferência realizada",
                              textDirection: TextDirection.ltr,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Conta: " + lista[index].conta,
                              textDirection: TextDirection.ltr,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Valor: ${lista[index].valor}",
                              textDirection: TextDirection.ltr,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
