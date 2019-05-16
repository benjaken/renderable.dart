

abstract class CodeGenExampleInterface1 {
}

abstract class CodeGenExampleInterface2 {
}

abstract class CodeGenExampleInterface3 {
}

class CodeGenExampleBase {
}

class CodeGenExample extends CodeGenExampleBase implements CodeGenExampleInterface1, CodeGenExampleInterface2, CodeGenExampleInterface3 {
    dynamic basicField;

    final int fieldWithModifier1 = 1;

}
