import 'package:flutter/material.dart';
import 'package:sistema_rutas/widgets/boton.dart';

class OtraPage extends StatefulWidget {
  const OtraPage({super.key});

  @override
  State<OtraPage> createState() => _OtraPageState();
}

class _OtraPageState extends State<OtraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otra página"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Página principal"),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               miboton(context, '/home','Ir a primera página',false),
               const SizedBox(width: 10.0,),
               miboton(context,'/tercera','Ir a tercera página',true),
            ],
          ),
        ],
      ),
    );
}
}