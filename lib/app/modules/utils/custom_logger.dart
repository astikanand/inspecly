import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 50,
    errorMethodCount: 3,
    colors: true,
    printEmojis: true
  ),

  output: SaveLogOutput(),
  level: Level.trace
);



class SaveLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      // ignore: avoid_print
      print(line);
    }
  }
}
