import 'package:flutter/foundation.dart';

class SeatNotifier extends ChangeNotifier {
  List<bool> _selectedSeats = List<bool>.generate(10, (index) => false);
  int? _rows;
  int? _columns;

  List<bool> get selectedSeats => _selectedSeats;
  int? get rows => _rows;
  int? get columns => _columns;

  void selectSeat(int index) {
    _selectedSeats[index] = !_selectedSeats[index];
    notifyListeners();
  }

  void setLayout(int rows, int columns) {
    _rows = rows;
    _columns = columns;
    _selectedSeats = List<bool>.generate(rows * columns, (index) => false);
    notifyListeners();
  }
}