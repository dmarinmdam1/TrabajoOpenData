class DataProvider {
  static List<String> contenidoBase() {
    final List<String> retorno = [];
    for (int i = 65; i < 91; i++) {
      retorno.add("Contenido Base  -  (" + String.fromCharCode(i) + (i - 64).toString() + ")");
    }
    return retorno;
  }
}
