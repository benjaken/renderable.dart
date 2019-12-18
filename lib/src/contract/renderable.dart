abstract class Renderable {
  String render();

  String toString() {
    return render();
  }

  String get code {
    return render();
  }
}
