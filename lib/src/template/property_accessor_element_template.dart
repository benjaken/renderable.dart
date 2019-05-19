const String property_accessor_element_template = '''
{{#isGetter}}
{{{returnType}}} get {{{name}}} {
  
} 
{{/isGetter}}
{{#isSetter}}
set {{{type}}} ({{#parameters}}{{{renderString}}}{{/parameters}}) {
  
} 
{{/isSetter}}
''';
