// ignore_for_file: file_names

// https://docs.flutter.dev/cookbook/persistence/reading-writing-files

import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

// {
//   'highscores': [
//     {
//       'date': now,
//       'score': score,
//     },
//   ]
// }
class Persistance {
  static const fileName = 'persistance.txt';
  static const int topX = 10;

  static Future<File> get localFile async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    return File('$path/${Persistance.fileName}');
  }

  Future<List> readHighscores() async {
    final File file = await localFile;
    // writeToFile(file, []); // pt clear highscores
    if (!file.existsSync()) {
      return [];
    }

    String contentString = file.readAsStringSync();
    Map<String, dynamic> data = const JsonDecoder().convert(contentString);
    return data['highscores'];
  }

  void writeScore(int score) async {
    List<dynamic> highscores = await readHighscores();

    String now = DateTime.now().toString().split('.')[0];
    highscores.add({'date': now, 'score': score});

    highscores.sort(((a, b) => b['score'] - a['score']));
    if (highscores.length > Persistance.topX) {
      highscores.removeLast();
    }

    final File file = await localFile;
    writeToFile(file, highscores);
  }

  void writeToFile(File file, List highscores) {
    var encoder = JsonEncoder.withIndent(' ' * 4);
    String content = encoder.convert({'highscores': highscores});

    file.openSync(mode: FileMode.write)
      ..writeStringSync(content)
      ..closeSync();
  }
}
