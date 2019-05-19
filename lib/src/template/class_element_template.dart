import 'package:renderable/src/template/shared_template.dart';

const String class_element_template = '''
${abstract_template}class {{{name}}}{{{typeParametersString}}}$supertype_template{{{interfacesString}}} {
{{#fields}}
{{{renderString}}}
{{/fields}}

{{#methods}}
{{{renderString}}}
{{/methods}}
}
''';

const String supertype_template = '{{#supertype}} extends {{{supertype}}}{{/supertype}}';
