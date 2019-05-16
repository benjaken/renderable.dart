import '../misc/some_file.dart' as sf;

class CodeGenFieldExample {
    dynamic simpleField;

    final dynamic finalField = 1;

    static const dynamic staticConstField = 1;

    static dynamic staticField;

    static final dynamic staticFinalField = 1;

    Object typedField;

    sf.SomeFile classTypedField;

    static final sf.SomeFile staticFinalClassTypedField = sf.SomeFile();

}
