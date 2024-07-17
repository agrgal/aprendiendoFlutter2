import 'package:flutter/material.dart';
import 'pages/index.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<String, WidgetBuilder> misrutas =  {
        "/home": (context) => const HomePage(),
        "/otra": (context) => const OtraPage(),
        "/tercera": (context) => const TerceraPage(),
        "/error": (context) => const Error404(),
        "/": (context) => const Login(),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "/",
      routes: misrutas,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Error404(),);
      },
    );
  }
}