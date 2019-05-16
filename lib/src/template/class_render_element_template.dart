import 'package:code_gen/src/template/shared_template.dart';

const String class_render_element_template = '''
${abstract_template}class {{{name}}}$supertype_template{{{interfacesString}}} {
{{#fields}}
    {{{renderString}}}
{{/fields}}
}
''';

const String supertype_template = '{{#supertype}} extends {{{supertype}}}{{/supertype}}';
