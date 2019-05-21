const String property_accessor_element_template = '''
{{#isGetter}}
{{{returnType}}} get {{{name}}} {
  {{{body}}}
} 
{{/isGetter}}
{{#isSetter}}
set {{{name}}}({{#parameters}}{{{renderString}}}{{/parameters}}) {
  {{{body}}}
} 
{{/isSetter}}
''';
