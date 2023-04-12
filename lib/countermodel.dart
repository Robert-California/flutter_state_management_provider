// Importerer foundation-biblioteket for at bruge ChangeNotifier-klassen.
import 'package:flutter/foundation.dart';

// CounterModel-klassen nedarver fra ChangeNotifier for at tillade lyttere at abonnere på ændringer.
class CounterModel extends ChangeNotifier {
  int _count = 0;

// Getter-metode for at få adgang til tællerværdien.
  int get count => _count;

  // Metode til at øge tælleren med 1 og underrette lyttere om ændringen.
  void increment() {
    _count++;
    notifyListeners();
  }
}
