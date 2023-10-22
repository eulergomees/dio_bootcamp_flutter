import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String readString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String readTextString(String text) {
    print(text);
    return readString();
  }

  static double? readDouble() {
    var value = readString();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? readTextDouble(String text) {
    print(text);
    return readDouble();
  }

  static double? readTextDoubleOutput(String text, String outputValue) {
    do {
      try {
        var value = readTextString(text);
        if (value == outputValue) {
          return null;
        }
        return double.parse(value);
      } catch (e) {
        print(text);
      }
    } while (true);
  }
}
