import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/component/delete_todo_dialog.dart';
import 'package:todo_list/const/route_argument.dart';
import 'package:todo_list/const/route_url.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/model/todo_list.dart';
import 'package:todo_list/utils/generate_todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoList todoList;

  @override
  void initState() {
    super.initState();
    todoList = TodoList(generateTodos(100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('清单'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            todo: todoList.list[index],
            onTap: (Todo todo) {
              Navigator.of(context).pushNamed(
                EDIT_TODO_PAGE_URL,
                arguments: EditTodoPageArgument(
                  openType: OpenType.Preview,
                  todo: todo,
                ),
              );
            },
            onFinished: (Todo todo) {
              setState(() {
                todo.isFinished = !todo.isFinished;
                todoList.update(todo);
              });
            },
            onStar: (Todo todo) {
              setState(() {
                todo.isStar = !todo.isStar;
                todoList.update(todo);
              });
            },
            onLongPress: (Todo todo) async {
              bool result = await showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteTodoDialog(
                      todo: todo,
                    );
                  });
              if (result) {
                setState(() {
                  todoList.remove(todo.id);
                });
              }
            },
          );
        },
      ),
    );
  }
}

typedef TodoEventCallback = Function(Todo todo);

class TodoItem extends StatelessWidget {
  final Todo todo;
  final TodoEventCallback onStar;
  final TodoEventCallback onFinished;
  final TodoEventCallback onTap;
  final TodoEventCallback onLongPress;

  const TodoItem({
    Key key,
    this.todo,
    this.onStar,
    this.onFinished,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: todo.isFinished ? 0.3 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              width: 2,
              color: todo.priority.color,
            ),
          ),
        ),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        height: 110,
        child: GestureDetector(
          onTap: () => onTap(todo),
          onLongPress: () => onLongPress(todo),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => onFinished(todo),
                        child: Image.asset(
                          todo.isFinished
                              ? 'assets/images/rect_selected.png'
                              : 'assets/images/rect.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(todo.title),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => onStar(todo),
                    child: Container(
                      child: Image.asset(
                        todo.isStar
                            ? 'assets/images/star.png'
                            : 'assets/images/star_normal.png',
                      ),
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/group.png',
                    width: 25.0,
                    height: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      todo.timeString,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}