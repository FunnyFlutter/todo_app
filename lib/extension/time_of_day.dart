import 'package:flutter/material.dart';

extension TimeOfDayUtils on TimeOfDay {
  String get timeString => '$hour:$minute';
}
