import 'package:renderable/src/template/shared_template.dart';

const String class_field_element_template = '''
    $static_template$const_template$final_template{{{type}}} {{{name}}}{{#value}} = {{{value}}}{{/value}};
''';

const String class_field_element_accessor_template = '''
{{#getter}}
{{{getter.returnType}}} get {{{getter.name}}} {
  
} 
{{/getter}}
{{#setter}}
set {{{setter.name}}}({{#setter.parameters}}{{{renderString}}}{{/setter.parameters}}) {
  
} 
{{/setter}}
''';
