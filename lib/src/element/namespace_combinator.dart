abstract class NamespaceCombinator {}

class ShowElementCombinator implements NamespaceCombinator {
  List<String> shownNames;

  ShowElementCombinator(this.shownNames);
}

class HideElementCombinator implements NamespaceCombinator {
  List<String> hiddenNames;

  HideElementCombinator(this.hiddenNames);
}
