import 'package:crud/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {

  // Variables para el TextField
  TextEditingController nameController = TextEditingController(text: "");
  
  @override
  Widget build(BuildContext context) {

    final Map misArgumentos = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = misArgumentos["nombre"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar nombre de la BD")
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column (
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Ingresa la modificación",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                  // print(nameController.text);
                  // print(misArgumentos['uid']);
                  updatePeople(misArgumentos['uid'], nameController.text).then((_){
                    Navigator.pop(context);
                  });
              }, 
              child: const Text("Actualizar"))
          ],
        ),
      )
    );
  }
}