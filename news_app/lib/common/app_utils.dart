import 'package:intl/intl.dart';

class AppUtils {
  static String formatDateAndTime(String timeStamp, {required String pattern}) {
    DateTime dt = DateTime.parse(timeStamp);
    DateFormat dateFormat = DateFormat(pattern, 'en');
    String formattedDate = dateFormat.format(dt);
    return formattedDate.toString();
  }
}
