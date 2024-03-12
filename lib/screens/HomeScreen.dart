import 'package:app_cine_reev/providers/seat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/homescreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(-0.1, -0.5), // 
              child: Transform.translate(
                offset: Offset(28, 20), // Acomodamos el texto al ajustar los valores
                child: const Text(
                  "Cinema Reev",
                  style: TextStyle(
                    fontSize: 40.0,  // Tamaño de fuente
                    fontWeight: FontWeight.bold,  // Le añadimos la propiedad bold
                    color: Colors.white, // Color del texto
                    shadows: [
                      Shadow( // Le añadimos sombra al texto
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    fontFamily: 'Arial', // Font family
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0), // Ajustar la distancia desde el fondo
                child: ElevatedButton(
                  child: const Text('Siguiente'),
                  onPressed: () {
                    final seatNotifier = Provider.of<SeatNotifier>(context, listen: false);
                    seatNotifier.setLayout(10, 14); // Configurar filas y columnas respectivamente
                    Navigator.pushNamed(context, '/seat_layout');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}