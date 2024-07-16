import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Instancia de nuestro paquete del tipo FlutterLocalNotificationPlugin
final FlutterLocalNotificationsPlugin fln = FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async { // función que inicia las notificaciones
// Inicio algunas constantes

  // Constante de inicialización en Android. Entre paréntesis el nombre del icono
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

  // En la carpeta android>>app>>src>>main>>res>>drawable debe haber un icono que se llame app_icon
  // ¿También en la carpeta drawable-v21? Lo voy a copiar.

  // Constante de inicialización en IOS
  const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();

  // Crear objeto de inicialización como tal
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  // Activar la inicializacion
  await fln.initialize(initializationSettings); 

}


// Función que muestra la notificación
Future<void> mostrarNotificacion() async {
  const AndroidNotificationDetails and = AndroidNotificationDetails(
    "0", "mi_canal",
    importance: Importance.high,
    priority: Priority.max,
    ); // Detalles de nuestra notificación ANDROID
  
  // Así sería en IOS
  const DarwinNotificationDetails dnd = DarwinNotificationDetails();

  const NotificationDetails nd = NotificationDetails(
    android: and,
    iOS: dnd,
  );
  
  await fln.show(1, // una ID, por ejemplo 1
    "Mi notificacion", // Título de la notificación
    "Esta es una notificación", // Cuerpo de la notificación
    nd, // Objeto detalles de la notificación
  );

}