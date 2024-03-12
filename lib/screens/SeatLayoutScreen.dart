import 'package:app_cine_reev/providers/seat_notifier.dart';
import 'package:app_cine_reev/screens/SeatSelectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SeatLayoutScreen extends StatefulWidget {
  const SeatLayoutScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SeatLayoutScreenState createState() => _SeatLayoutScreenState();
}

class _SeatLayoutScreenState extends State<SeatLayoutScreen> {
  final _formKey = GlobalKey<FormState>();
  late int _rows, _columns;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Asientos'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Ingrese el numero de filas'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un número';
                }
                return null;
              },
              onSaved: (value) {
                _rows = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Ingrese el número de columnas'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un número';
                }
                return null;
              },
              onSaved: (value) {
                _columns = int.parse(value!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final seatNotifier = Provider.of<SeatNotifier>(context, listen: false);
                  seatNotifier.setLayout(_rows, _columns);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SeatSelectionScreen()),
                  );
                }
              },
              child: const Text('CONTINUAR'),
            ),
          ],
        ),
      ),
    );
  }
}