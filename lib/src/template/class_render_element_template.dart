const String class_render_element_template = '''
${abstract_template}class {{{name}}}$supertype_template{{{interfacesString}}} {

}
''';

const String abstract_template = '{{#isAbstract}}abstract {{/isAbstract}}';

const String supertype_template = '{{#supertype}} extends {{{supertype}}}{{/supertype}}';
