import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openUrlPlatform(String url) async {
  final uri = Uri.parse(url);
  try {
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      return true;
    }
  } catch (_) {
    // Fallback to native desktop command if url_launcher is unavailable.
  }

  try {
    if (Platform.isMacOS) {
      await Process.run('open', [url]);
      return true;
    }
    if (Platform.isWindows) {
      await Process.run('cmd', ['/c', 'start', url]);
      return true;
    }
    if (Platform.isLinux) {
      await Process.run('xdg-open', [url]);
      return true;
    }
  } catch (_) {
    // ignore fallback errors.
  }

  return false;
}
