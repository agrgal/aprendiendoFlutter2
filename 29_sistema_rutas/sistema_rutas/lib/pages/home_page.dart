import 'package:flutter/material.dart';
import 'package:sistema_rutas/widgets/boton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi página inicial"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Página principal"),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               miboton(context, '/otra','Ir a segunda página',true),
               const SizedBox(width: 10.0,),
               miboton(context, '/tercera','Ir a tercera página',true),
            ],
          ),
        ],
      ),

    );
  }
}