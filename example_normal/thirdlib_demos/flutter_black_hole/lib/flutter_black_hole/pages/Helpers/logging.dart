import 'dart:developer';
import 'dart:io' as SystemIO;

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:logging/logging.dart';

Future<void> initializeLogging() async {
  final SystemIO.Directory tempDir = await getTemporaryDirectory();
  final SystemIO.File logFile = SystemIO.File('${tempDir.path}/logs/logs.txt');
  if (!await logFile.exists()) {
    await logFile.create(recursive: true);
  }
  // clear old session data
  await logFile.writeAsString('');
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) async {
    if (record.level.name != 'INFO') {
      log('${record.level.name}: ${record.time}: record.message: ${record.message}\nrecord.error: ${record.error}\nrecord.stackTrace: ${record.stackTrace}\n\n');
      try {
        await logFile.writeAsString(
          '${record.level.name}: ${record.time}: record.message: ${record.message}\nrecord.error: ${record.error}\nrecord.stackTrace: ${record.stackTrace}\n\n',
          mode: SystemIO.FileMode.append,
        );
      } catch (e) {
        log('Error writing to log file: $e');
      }
    } else {
      log('${record.level.name}: ${record.time}: record.message: ${record.message}\n\n');
      try {
        await logFile.writeAsString(
          '${record.level.name}: ${record.time}: record.message: ${record.message}\n\n',
          mode: SystemIO.FileMode.append,
        );
      } catch (e) {
        log('Error writing to log file: $e');
      }
    }
  });
}
