import 'dart:convert';

class Logger {
  static void log(String bodyReponse) {
    final object = json.decode(bodyReponse);
    final prettyString = JsonEncoder.withIndent('  ').convert(object);

    print(prettyString);
  }
}
