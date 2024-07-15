import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        drawer:  Drawer(
          // width: 400,
          child: Container(
            color: Color.fromARGB(255, 205, 205, 161),
            child: Column(
              children: [
                  Container(
                    width: 100,
                    height: 60,
                    margin: const EdgeInsets.only(top: 50.0,bottom: 20.0,),
                    child: Image.network("https://e7.pngegg.com/pngimages/959/75/png-clipart-blue-flat-car-car-flat-car-thumbnail.png"),
                  ),
                  const Text("Aurelio Gallardo", style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0),),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30.0),
                    padding: EdgeInsets.all(20.0),
                    color: Colors.grey,
                    child: const Text("Inicio"),
                  ),                  
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(20.0),
                    color: Colors.grey,
                    child: const Text("Settings"),
                  ),
                  Expanded(child: Container(),),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(20.0),
                    color: const Color.fromARGB(255, 78, 78, 78),
                    child: const Text("Salir"),
                  )
              ],
            ),
          ),

        ),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World 2'),
        ),
      ),
    );
  }
}