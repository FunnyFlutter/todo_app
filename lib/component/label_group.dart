import 'package:flutter/material.dart';

class LabelGroup extends StatelessWidget {
  LabelGroup({
    Key key,
    @required this.labelText,
    this.labelStyle,
    @required this.child,
    this.padding,
  })  : assert(labelText != null),
        assert(child != null),
        super(key: key);

  final String labelText;
  final TextStyle labelStyle;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            labelText,
            style: labelStyle ??
                Theme.of(context).inputDecorationTheme?.labelStyle,
          ),
          this.child,
        ],
      ),
    );
  }
}
