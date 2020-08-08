import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 支持用户点击弹出的日期选择器组件
class DateFieldGroup extends StatelessWidget {
  const DateFieldGroup({
    Key key,
    @required this.initialDate,
    @required this.startDate,
    @required this.endDate,
    this.selectableDayPredicate,
    this.initialDatePickerMode = DatePickerMode.day,
    @required this.child,
    this.onSelect,
  }) : super(key: key);

  /// 设置弹窗出现时默认选中的日期
  final DateTime initialDate;

  /// 设置用户可以选择的日期上界
  final DateTime startDate;

  /// 设置用户可以选择的日期下界
  final DateTime endDate;

  /// 设置一个函数，更加精确的设置哪些日期可以被选中，哪些不能被选中
  final SelectableDayPredicate selectableDayPredicate;

  /// 设置选择模式，是用来选择年份，还是选择月和日。默认是用来选择月和日的
  final DatePickerMode initialDatePickerMode;

  /// 用来展示选择的日期的组件
  final Widget child;

  /// 日期选择后的的回调
  final Function(DateTime) onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AbsorbPointer(
        child: child,
      ),
      onTap: () async {
        DateTime selectedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: startDate,
          lastDate: endDate,
          selectableDayPredicate: selectableDayPredicate,
          initialDatePickerMode: initialDatePickerMode,
        );
        if (selectedDate != null && onSelect != null) {
          onSelect(selectedDate);
        }
      },
    );
  }
}
