import "package:crud/services/firebase_service.dart";
import "package:flutter/material.dart";


class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lectura de la base de datos'),
      ),
      body: FutureBuilder (
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                // return Text(snapshot.data?[index]['name'] ?? ""); 
                return Dismissible(
                  onDismissed: (direction) async {
                    await deletePeople(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool resultado = false;
                    
                    resultado = await showDialog( 
                      context: context, 
                      builder: (_){
                        return AlertDialog(
                          title: const Text("¿Estás seguro?"),
                          content: Text("¿Estas seguro de que quieres eliminar a ${snapshot.data?[index]['name']}?"),
                          actions: [
                            TextButton(
                              onPressed: (){
                                return Navigator.pop(context, false);
                              }, 
                              child: const Text("Cancelar", style: TextStyle(color: Colors.red),),
                              ), 
                              const SizedBox(width: 10.0,),
                              TextButton(
                              onPressed: (){
                                return Navigator.pop(context, true);
                              }, 
                              child: const Text("Sí, borrar"),
                              ),                             
                          ],
                        );
                      });

                    return resultado ;
                  },
                  background: Container(
                    color: Colors.red[300],
                    child: const Icon(Icons.delete_sweep_outlined,)
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(snapshot.data?[index]['uid']), // UniqueKey(),
                  child: ListTile(
                    title:Text(snapshot.data?[index]['name']),
                    onTap: () async {
                      await Navigator.pushNamed(context, "/edit", 
                      arguments: {
                        "nombre":snapshot.data?[index]['name'], 
                        "uid": snapshot.data?[index]['uid'],
                      });
                      setState(() {});
                    }, 
                  ),
                );
              });
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(226, 147, 15, 15),                  
                  color: Colors.amber,
                ),
                );
            }
          },
          ), 
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, "/add");
              setState(() {});
            },
            child: const Icon(Icons.add)),       
      );
  }
}