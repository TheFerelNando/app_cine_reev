import 'package:app_cine_reev/providers/seat_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seatNotifier = Provider.of<SeatNotifier>(context);
    final rows = seatNotifier.rows;
    final columns = seatNotifier.columns;

    if (rows == null || columns == null) {
      return Center(child: Text('Rows or columns are null'));
    }

    return WillPopScope(
      onWillPop: () async => false, // Previene al usuario de regresar
      child: Scaffold(
        body: Container(
          color: Colors.black, // Color de fondo a negro
          child: GridView.builder(
            padding: const EdgeInsets.all(2.0),
            itemCount: rows * columns,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: 0.7, // Aqui ajustamos el ratio del GridTile
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            ),
            itemBuilder: (context, index) {
              final row = rows - 1 - (index / columns).floor();
              final column = index % columns;
              final seatId = '${String.fromCharCode(65 + row)}${column + 1}';

              return Stack(
                children: [
                  
                  GestureDetector(
                    onTap: () {
                      seatNotifier.selectSeat(index);
                    },
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: GridTile(
                        child: Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  seatNotifier.selectedSeats[index] ? 'assets/libre.png' : 'assets/occupied.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 7.0,
                              left: 21.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  seatId,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 2.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Le añadimos gradiente a nuestra pseudoalfombra
                  if (column == 6)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 12,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 139, 132, 121)], // Change these colors to customize your gradient
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  if (column == 7)
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 12,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 139, 132, 121)], // Change these colors to customize your gradient
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}