const String property_accessor_element_template = '''
{{#isGetter}}
{{{returnType}}} get {{{name}}} {
  
} 
{{/isGetter}}
{{#isSetter}}
set {{{name}}}({{#parameters}}{{{renderString}}}{{/parameters}}) {
  
} 
{{/isSetter}}
''';
