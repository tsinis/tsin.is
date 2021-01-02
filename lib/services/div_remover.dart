// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class DivRemover {
  static void removeFromHTML() {
    final List<Node> loader = document.getElementsByClassName('loader');
    if (loader.isNotEmpty) {
      loader.first.remove();
    }
  }
}
