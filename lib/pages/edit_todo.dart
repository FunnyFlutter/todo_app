import 'package:flutter/material.dart';
import 'package:todo_list/component/label_group.dart';
import 'package:todo_list/const/route_argument.dart';
import 'package:todo_list/model/todo.dart';

const TextStyle _labelTextStyle = TextStyle(
  color: Color(0xFF1D1D26),
  fontFamily: 'Avenir',
  fontSize: 14.0,
);
const EdgeInsets _labelPadding = const EdgeInsets.fromLTRB(20, 10, 20, 20);
const InputBorder _textFormBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.black26,
    width: 0.5,
  ),
);

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({Key key}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  OpenType _openType;
  Todo _todo;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildTextFormField(
              '名称',
              '任务名称',
              maxLines: 1,
              initialValue: _todo.title,
              onSaved: (value) => _todo.title = value,
            ),
            _buildTextFormField(
              '描述',
              '任务描述',
              initialValue: _todo.description,
              onSaved: (value) => _todo.description = value,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    String title,
    String hintText, {
    int maxLines,
    String initialValue,
    FormFieldSetter<String> onSaved,
  }) {
    TextInputType inputType =
        maxLines == null ? TextInputType.multiline : TextInputType.text;
    return LabelGroup(
      labelText: title,
      labelStyle: _labelTextStyle,
      padding: _labelPadding,
      child: TextFormField(
        keyboardType: inputType,
        validator: (String value) {
          return value.length > 0 ? null : '$title 不能为空';
        },
        onSaved: onSaved,
        textInputAction: TextInputAction.done,
        maxLines: maxLines,
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: _textFormBorder,
        ),
      ),
    );
  }

  void _edit() {
    setState(() {
      _openType = OpenType.Edit;
    });
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).pop(_todo);
    }
  }
}

class _OpenTypeConfig {
  final String title;
  final IconData icon;
  final Function onPressed;

  const _OpenTypeConfig(this.title, this.icon, this.onPressed);
}
