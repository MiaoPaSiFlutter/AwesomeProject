import 'dart:io' as SystemIO;

import 'package:flutter/material.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:hive/hive.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:logging/logging.dart';

import 'package:flutter_black_hole/flutter_black_hole/pages/CustomWidgets/custom_widgets_index.dart';
import 'package:flutter_black_hole/flutter_black_hole/pages/Helpers/helpers_index.dart';
import 'package:flutter_black_hole/flutter_black_hole/pages/flutter_gen/gen_l10n/app_localizations.dart';

Future<void> createBackup(
  BuildContext context,
  List items,
  Map<String, List> boxNameData, {
  String? path,
  String? fileName,
  bool showDialog = true,
}) async {
  if (SystemIO.Platform.isAndroid) {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) {
      await [
        Permission.storage,
        Permission.accessMediaLocation,
        Permission.mediaLibrary,
      ].request();
    }
    status = await Permission.storage.status;
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
  if (!context.mounted) return;
  final String savePath = path ??
      await Picker.selectFolder(
        context: context,
        message: AppLocalizations.of(context)!.selectBackLocation,
      );
  if (savePath.trim() != '') {
    try {
      final saveDir = SystemIO.Directory(savePath);
      final dirExists = await saveDir.exists();
      if (!dirExists) saveDir.create(recursive: true);
      final List<SystemIO.File> files = [];
      final List boxNames = [];

      for (int i = 0; i < items.length; i++) {
        boxNames.addAll(boxNameData[items[i]]!);
      }

      for (int i = 0; i < boxNames.length; i++) {
        await Hive.openBox(boxNames[i].toString());
        try {
          await SystemIO.File(Hive.box(boxNames[i].toString()).path!)
              .copy('$savePath/${boxNames[i]}.hive');
        } catch (e) {
          await [
            Permission.manageExternalStorage,
          ].request();
          await SystemIO.File(Hive.box(boxNames[i].toString()).path!)
              .copy('$savePath/${boxNames[i]}.hive');
        }

        files.add(SystemIO.File('$savePath/${boxNames[i]}.hive'));
      }

      final now = DateTime.now();
      final String time =
          '${now.hour}${now.minute}_${now.day}${now.month}${now.year}';
      final zipFile = SystemIO.File(
          '$savePath/${fileName ?? "BlackHole_Backup_$time"}.zip');

      await ZipFile.createFromFiles(
        sourceDir: saveDir,
        files: files,
        zipFile: zipFile,
      );
      for (int i = 0; i < files.length; i++) {
        files[i].delete();
      }
      if (showDialog && context.mounted) {
        ShowSnackBar().showSnackBar(
          context,
          AppLocalizations.of(context)!.backupSuccess,
        );
      }
    } catch (e) {
      Logger.root.severe('Error in creating backup', e);
      if (context.mounted) {
        ShowSnackBar().showSnackBar(
          context,
          '${AppLocalizations.of(context)!.failedCreateBackup}\nError: $e',
        );
      }
    }
  } else {
    if (context.mounted) {
      ShowSnackBar().showSnackBar(
        context,
        AppLocalizations.of(context)!.noFolderSelected,
      );
    }
  }
}

Future<void> restore(BuildContext context) async {
  Logger.root.info('Prompting for restore file selection');
  final String savePath = await Picker.selectFile(
    context: context,
    // ext: ['zip'],
    message: AppLocalizations.of(context)!.selectBackFile,
  );
  Logger.root.info('Selected restore file path: $savePath');
  if (savePath != '') {
    final SystemIO.File zipFile = SystemIO.File(savePath);
    final SystemIO.Directory tempDir = await getTemporaryDirectory();
    final SystemIO.Directory destinationDir =
        SystemIO.Directory('${tempDir.path}/restore');

    try {
      Logger.root.info('Extracting backup file');
      await ZipFile.extractToDirectory(
        zipFile: zipFile,
        destinationDir: destinationDir,
      );
      final List<SystemIO.FileSystemEntity> files =
          await destinationDir.list().toList();
      Logger.root.info('Found ${files.length} backup files');

      for (int i = 0; i < files.length; i++) {
        final String backupPath = files[i].path;
        final String boxName =
            backupPath.split('/').last.replaceAll('.hive', '');
        final Box box = await Hive.openBox(boxName);
        final String boxPath = box.path!;
        await box.close();

        try {
          await SystemIO.File(backupPath).copy(boxPath);
        } finally {
          await Hive.openBox(boxName);
        }
      }
      await destinationDir.delete(recursive: true);
      if (!context.mounted) return;
      ShowSnackBar()
          .showSnackBar(context, AppLocalizations.of(context)!.importSuccess);
    } catch (e) {
      Logger.root.severe('Error in restoring backup', e);
      if (!context.mounted) return;
      ShowSnackBar().showSnackBar(
        context,
        '${AppLocalizations.of(context)!.failedImport}\nError: $e',
      );
    }
  } else {
    Logger.root.severe('Error in restoring backup', 'No file selected');
    if (!context.mounted) return;
    ShowSnackBar().showSnackBar(
      context,
      AppLocalizations.of(context)!.noFileSelected,
    );
  }
}
