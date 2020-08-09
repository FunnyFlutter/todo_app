import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';

class PriorityFieldGroup extends StatefulWidget {
  const PriorityFieldGroup({
    Key key,
    this.initialValue,
    this.onChange,
    @required this.child,
  }) : super(key: key);

  final Priority initialValue;
  final Function(Priority) onChange;
  final Widget child;

  @override
  _PriorityFieldGroupState createState() => _PriorityFieldGroupState();
}

class _PriorityFieldGroupState extends State<PriorityFieldGroup> {
  GlobalKey<PopupMenuButtonState> popupMenuStateKey =
      GlobalKey<PopupMenuButtonState>();

  void _onTap() {
    popupMenuStateKey.currentState.showButtonMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: _onTap,
          child: widget.child,
          behavior: HitTestBehavior.opaque,
        ),
        PopupMenuButton<Priority>(
          key: popupMenuStateKey,
          itemBuilder: (BuildContext context) =>
              Priority.values.map(_buildPriorityPopupMenuItem).toList(),
          onSelected: widget.onChange,
          child: Container(),
        ),
      ],
    );
  }

  PopupMenuItem<Priority> _buildPriorityPopupMenuItem(Priority priority) {
    return PopupMenuItem<Priority>(
      value: priority,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(priority.description),
          Container(
            width: 100,
            height: 5,
            color: priority.color,
          )
        ],
      ),
    );
  }
}
