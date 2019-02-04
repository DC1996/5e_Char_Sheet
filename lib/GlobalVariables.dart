import 'dart:io';

import 'package:async/async.dart';

AsyncMemoizer<bool> memo = AsyncMemoizer();


File jsonFile;
String fileName = "geniusly.json";