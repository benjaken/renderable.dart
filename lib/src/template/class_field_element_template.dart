import 'package:code_gen/src/template/shared_template.dart';

const String class_field_element_template = '''
    $static_template$const_template$final_template{{{type}}} {{{name}}}{{#value}} = {{{value}}}{{/value}};
''';
