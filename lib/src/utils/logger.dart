import 'dart:developer';

debug(String message) {
  log(
    '[🤚][🤞] $message',
  );
}

fly(String message) {
  log(
    '[🐦] [🐦] $message ',
  );
}

fly2(String message) {
  log(
    '╔══════════════════════════════════════════════════════════════╗\n🐦\n$message\n╚══════════════════════════════════════════════════════════════╝',
  );
}

warning(String message) {
  log(
    // '[⚠️] $message',
    '[👁👁] $message',
  );
}

error(String message) {
  log(
    '[💥][💥] $message',
  );
}

info(String message) {
  log(
    '[🐒🚨] $message',
  );
}
