import 'package:flutter/material.dart';
import 'package:notificaciones_locales/services/notification_service.dart';

void main() async { // es una función asíncr

  WidgetsFlutterBinding.ensureInitialized(); // Se asegura de ejecutar todas las inicializaciones antes de ejecutar runApp
  await initNotifications(); // ejecuta el método de inicialización que hicimos del servicio.

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const PaginaPrinicpal(),
      ),
    );
  }
}

// Página Principal
class PaginaPrinicpal extends StatelessWidget {
  const PaginaPrinicpal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          mostrarNotificacion();
        },
        child: const Text('Mostrar la notificación')
        ),
    );
  }
}