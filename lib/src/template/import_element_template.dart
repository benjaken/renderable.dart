const String import_element_template =
    '''import '{{{path}}}'{{#prefix}}{{#isDeferred}} deferred{{/isDeferred}} as {{{prefix}}}{{/prefix}}{{{showsString}}}{{{hidesString}}};''';
