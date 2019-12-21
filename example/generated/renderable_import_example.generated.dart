import "../misc/some_file.dart";
import "../misc/some_file.dart" as sf;
import "../misc/some_file.dart" show SomeFile;
import "../misc/some_file.dart" hide SomeFile;
import "../misc/some_file.dart" show SomeFile hide SomeFile;
import "../misc/some_file.dart" deferred as sf2 show SomeFile, SomeFile2 hide SomeFile2, SomeFile3;