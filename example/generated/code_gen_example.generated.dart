abstract class RenderableExampleInterface1 {}

abstract class RenderableExampleInterface2 {}

abstract class RenderableExampleInterface3 {}

class RenderableExampleBase {}

class RenderableExample extends RenderableExampleBase
    implements
        RenderableExampleInterface1,
        RenderableExampleInterface2,
        RenderableExampleInterface3 {
  dynamic basicField;

  final int fieldWithModifier1 = 1;
}
