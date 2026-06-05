import 'url_open_helper_stub.dart'
    if (dart.library.io) 'url_open_helper_io.dart'
    if (dart.library.html) 'url_open_helper_web.dart';

Future<bool> openUrl(String url) => openUrlPlatform(url);
