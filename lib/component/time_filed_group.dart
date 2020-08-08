import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeFieldGroup extends StatelessWidget {
  const TimeFieldGroup({
    Key key,
    @required this.initialTime,
    @required this.child,
    this.onSelect,
  }) : super(key: key);

  final TimeOfDay initialTime;
  final Widget child;
  final Function(TimeOfDay) onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AbsorbPointer(
        child: child,
      ),
      onTap: () async {
        TimeOfDay timeOfDay = await showTimePicker(
          context: context,
          initialTime: initialTime,
        );
        if (timeOfDay != null && onSelect != null) {
          onSelect(timeOfDay);
        }
      },
    );
  }
}
