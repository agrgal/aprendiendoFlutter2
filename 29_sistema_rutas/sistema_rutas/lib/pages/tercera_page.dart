import 'package:flutter/material.dart';
import 'package:sistema_rutas/widgets/boton.dart';
class TerceraPage extends StatefulWidget {
  const TerceraPage({super.key});

  @override
  State<TerceraPage> createState() => _TerceraPageState();
}

class _TerceraPageState extends State<TerceraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tercera página"),
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
               miboton(context,'/otra','Ir a segunda página',true),
            ],
          ),
        ],
      ),
    );
}
}