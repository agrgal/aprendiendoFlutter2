import "package:cloud_firestore/cloud_firestore.dart";

// Instancia de Firebase Store
FirebaseFirestore db =FirebaseFirestore.instance;

// Obtención de datos
Future<List> getPeople() async { // Función asíncrona que devuelve los datos
  List people = []; // inicializo la lista vacía
  CollectionReference crpeople = db.collection("people"); // creo una coleccion crpeople de la base de datos. 
  QuerySnapshot qspeople = await crpeople.get(); // obtiene todos los documentos de la colección
  // QuerySnapshot qspeople = await db.collection("people").get(); --> mirar que tb nos vale
  for (var documento in qspeople.docs) {
    final Map<String,dynamic> datos = documento.data() as Map<String,dynamic>;
    final person = {
      "name": datos["name"],
      "uid": documento.id,
    } ;   
    people.add(person); // por cada documento añade esos datos a la lista
  }
  await Future.delayed( // forzar que se muestre el elemento de carga
    const Duration(seconds: 2),
  );
  return people; // retorna la lista
}

// Grabar datos
Future<void> addPeople(String name) async{
  await db.collection("people").add(
    {"name": name}, // En formato parecido a JSON
  );
}

// Actualizar datos
Future<void> updatePeople (String uid, String newname) async {
  await db.collection("people").doc(uid).set({"name":newname});
}

// Eliminar datos
Future<void> deletePeople(String uid) async {
  await db.collection("people").doc(uid).delete();
}