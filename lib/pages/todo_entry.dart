import 'package:flutter/material.dart';

class TodoEntryPage extends StatelessWidget {
  const TodoEntryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          this.runtimeType.toString(),
        ),
      ),
    );
  }
}
