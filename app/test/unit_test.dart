import 'package:app/src/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('get time in hh:mm a test', () {
    int dt = 1636848000; // Epoch timestamp
    String hour = getTimeInHHMM(dt);
    expect('05:30 AM', hour);
  });
  test('get time in hh a test', () {
    int dt = 1636848000; // Epoch timestamp
    String hour = getTimeInHour(dt);
    expect('05 AM', hour);
  });
  test('get day of epoch timestamp', () {
    int dt = 1636848000; // Epoch timestamp
    String day = getDayFromEpoch(dt);
    expect('Sunday', day);
  });
}
