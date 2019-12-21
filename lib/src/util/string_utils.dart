abstract class StringUtils {
  static String quote(String originString) {
    return '"$originString"';
  }

  static String append(String originString, String suffix) {
    return originString + suffix;
  }

  static String prepend(String originString, String prefix) {
    return prefix + originString;
  }
}
