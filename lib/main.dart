import 'package:app_cine_reev/providers/seat_notifier.dart';
import 'package:app_cine_reev/screens/HomeScreen.dart';
import 'package:app_cine_reev/screens/SeatSelectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft])
    .then((_) {
      runApp(
        ChangeNotifierProvider(
          create: (context) => SeatNotifier(),
          child: const MyApp(),
        ),
      );
    });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/seat_layout': (context) => WillPopScope(
  onWillPop: () async => false, // Previene al usuario de regresar a la pantalla anterior
  child: SeatSelectionScreen(),
),
      },
    );
  }
}


