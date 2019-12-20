import 'package:build/build.dart';
import 'package:demo/generator/demo_generator.dart';
import 'package:demo/generator/mirror_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder mirrorBuilder(BuilderOptions options) => LibraryBuilder(
      MirrorGenerator(),
      generatedExtension: '.mirror.dart',
    );

Builder demoBuilder(BuilderOptions options) => LibraryBuilder(
      DemoGenerator(),
      generatedExtension: '.demo.dart',
    );
