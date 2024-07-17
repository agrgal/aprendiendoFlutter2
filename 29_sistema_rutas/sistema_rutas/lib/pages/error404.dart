import 'package:flutter/material.dart';
import 'package:sistema_rutas/widgets/boton.dart';

class Error404 extends StatefulWidget {
  const Error404({super.key});

  @override
  State<Error404> createState() => _Error404State();
}

class _Error404State extends State<Error404> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: const Text("Página de error 404"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Error 404", style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 114, 26, 19))),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               miboton(context,'/','Ir a página principal',false),
            ],
          ),
        ],
      ),
    );
}
}