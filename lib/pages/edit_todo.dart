import 'package:flutter/material.dart';
import 'package:todo_list/const/route_argument.dart';
import 'package:todo_list/model/todo.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({Key key}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  OpenType _openType;
  Todo _todo;

  Map<OpenType, _OpenTypeConfig> _openTypeConfigMap;

  @override
  void initState() {
    super.initState();

    _openTypeConfigMap = {
      OpenType.Preview: _OpenTypeConfig('查看TODO', Icons.edit, _edit),
      OpenType.Edit: _OpenTypeConfig('编辑TODO', Icons.check, _submit),
      OpenType.Add: _OpenTypeConfig('添加TODO', Icons.check, _submit),
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    EditTodoPageArgument arguments = ModalRoute.of(context).settings.arguments;
    _openType = arguments.openType;
    _todo = arguments.todo ?? Todo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_openTypeConfigMap[_openType].title),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _openTypeConfigMap[_openType].icon,
              color: Colors.black87,
            ),
            onPressed: _openTypeConfigMap[_openType].onPressed,
          ),
        ],
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Center(child: Text(_openType.toString()));
  }

  void _edit() {
    setState(() {
      _openType = OpenType.Edit;
    });
  }

  void _submit() {
    Navigator.of(context).pop();
  }
}

class _OpenTypeConfig {
  final String title;
  final IconData icon;
  final Function onPressed;

  const _OpenTypeConfig(this.title, this.icon, this.onPressed);
}
