import 'dart:math';

class Bomb {
  // ignore: prefer_final_fields
  List<int> _position = [];
  List<int> get position => _position;

  void generateBombs() {
    int quantity = 10;
    Random random = Random();
    for (int bomb = 0; bomb < quantity; bomb++) {
      int setBomb = random.nextInt(100);
      while (_position.contains(setBomb)) {
        setBomb = random.nextInt(100);
      }
      _position.add(setBomb);
    }
  }

  void clearBombs() {
    _position.clear();
  }
}
