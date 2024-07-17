import 'package:flutter/material.dart';
import 'package:sistema_rutas/widgets/boton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página de Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Página de Login"),
          const SizedBox(height: 10.0,),
          miboton(context, '/home','Ir a página principal',false),          
        ],
      ),
    );
}
}