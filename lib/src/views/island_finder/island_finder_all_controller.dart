// ignore_for_file: avoid_print

import 'dart:math';

class IslandFinderAllController {
  int numeroDeIslas = 0;
  var rng = Random();
  int matrixZize = 0;
  List<List<int>> matrix = [];
  List<List<bool>> visited = [];

  void generateMatrix(int size) {
    matrixZize = size;
    matrix = List.generate(
        matrixZize, (i) => List.generate(matrixZize, (j) => rng.nextInt(2)));

    contarIslas();
  }

  void contarIslas() {
    numeroDeIslas = 0;
    visited = List.generate(
        matrixZize, (i) => List.generate(matrixZize, (j) => false));
    for (int i = 0; i < matrix.length; i++) {
      print(matrix[i]);
      for (int j = 0; j < matrix.length; j++) {
        if (matrix[i][j] == 1 && !visited[i][j]) {
          buscarAlrededor(i, j, matrix.length);
          numeroDeIslas++;
        }
      }
    }
    print(numeroDeIslas.toString());
  }

  void buscarAlrededor(int fila, int columna, int maximo) {
    int filaActual = fila > 0 ? fila - 1 : fila;
    int filaMax = fila < maximo - 1 ? fila + 1 : fila;
    int columnaActual = columna > 0 ? columna - 1 : columna;
    int columnaMax = columna < maximo - 1 ? columna + 1 : columna;
    visited[fila][columna] = true;
    for (int i = filaActual; i <= filaMax; i++) {
      for (int j = columnaActual; j <= columnaMax; j++) {
        if (matrix[i][j] == 1 && !visited[i][j]) {
          buscarAlrededor(i, j, matrix.length);
        }
      }
    }
  }
}
