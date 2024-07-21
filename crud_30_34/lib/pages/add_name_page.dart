import 'package:crud/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {

  // Variables para el TextField
  TextEditingController nameController = TextEditingController(text: "");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Añadir Nombre a la BD")
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column (
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Introduce el nombre",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                  // print(nameController.text);
                  addPeople(nameController.text).then((_) {
                    Navigator.pop(context);
                  });
              }, 
              child: const Text("Guardar"))
          ],
        ),
      )
    );
  }
}