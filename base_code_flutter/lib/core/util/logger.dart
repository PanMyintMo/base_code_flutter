import 'package:logger/web.dart';

final logger = Logger(
  printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
    methodCount: 0,
  ),
);