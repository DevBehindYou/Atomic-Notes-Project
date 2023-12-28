import 'package:hive/hive.dart';

class SyncStatusHelper {
  static late Box<bool> syncBox;

  static Future<void> init() async {}

  static bool get isSyncOn => syncBox.get ?? true;

  static Future<void> setSyncStatus(bool isSyncOn) async {
    await syncBox.put(
      'isSyncOn',
    );
  }
}
