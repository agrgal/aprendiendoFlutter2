import 'package:flutter/material.dart';
import 'package:sistema_rutas/pages/index.dart';

Widget miboton(BuildContext contexto, String pagina, String leyenda, bool normal) {
  return ElevatedButton(
          onPressed: (){
              // FormaNueva
              if (normal) {
                Navigator.pushNamed(contexto, pagina);
              } else {              
                // Navigator.pushReplacementNamed(contexto, pagina);
                /*
                 Navigator.pushAndRemoveUntil(
                  contexto, 
                  MaterialPageRoute(builder: (context)=> const HomePage()),
                  (Route<dynamic> route) => false,); */
                Navigator.pushNamedAndRemoveUntil(contexto, 
                  pagina, 
                   (Route<dynamic> route) => false,
                  );
              }
          },
          child: Text(leyenda)
          ,);
}

