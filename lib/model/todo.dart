import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Todo {
  /// ID
  final String id;

  /// 标题
  String title;

  /// 描述
  String description;

  /// 日期
  DateTime date;

  /// 开始时间
  TimeOfDay startTime;

  /// 结束时间
  TimeOfDay endTime;

  /// 是否完成
  bool isFinished;

  /// 是否星标任务
  bool isStar;

  Todo({
    String id,
    this.title = "",
    this.description = "",
    this.date,
    this.startTime = const TimeOfDay(hour: 0, minute: 0),
    this.endTime = const TimeOfDay(hour: 0, minute: 0),
    this.isFinished = false,
    this.isStar = false,
  }) : this.id = id ?? generateNewId() {
    // 如果开始时间为空，则设置为当前时间
    if (date == null) {
      date = DateTime.now().dayTime;
    }
  }

  static Uuid _uuid = Uuid();

  static String generateNewId() => _uuid.v1();
}
