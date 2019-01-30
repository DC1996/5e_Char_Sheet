import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:char_sheet_5e/App_Data_Manager.dart';
import 'Application.dart';

void main() {
  //debugPaintSizeEnabled = true; //shows widget boundaries
  runApp(new AppDataManager(new Application()));
}