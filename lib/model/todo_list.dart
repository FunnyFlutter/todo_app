import 'package:flutter/foundation.dart';
import 'package:todo_list/model/network_client.dart';
import 'package:todo_list/model/todo.dart';

import 'db_provider.dart';

enum TodoListChangeType {
  Delete,
  Insert,
  Update,
}

class TodoListChangeInfo {
  const TodoListChangeInfo({
    this.todoList = const <Todo>[],
    this.insertOrRemoveIndex = -1,
    this.type = TodoListChangeType.Update,
  });

  final int insertOrRemoveIndex;
  final List<Todo> todoList;
  final TodoListChangeType type;
}

const emptyTodoListChangeInfo = TodoListChangeInfo();

class TodoList extends ValueNotifier<TodoListChangeInfo> {
  List<Todo> _todoList = [];
  DbProvider _dbProvider;
  final String userKey;

  TodoList(this.userKey) : super(emptyTodoListChangeInfo) {
    _dbProvider = DbProvider(userKey);
    _dbProvider.loadFromDataBase().then((List<Todo> todoList) async {
      if (todoList.isNotEmpty) {
        todoList.forEach((e) => add(e));
      }
      syncWithNetwork();
    });
  }

  int get length => _todoList.length;
  List<Todo> get list => List.unmodifiable(_todoList);

  void add(Todo todo) {
    _todoList.add(todo);
    _sort();
    int index = _todoList.indexOf(todo);
    _dbProvider.add(todo);
    value = TodoListChangeInfo(
      insertOrRemoveIndex: index,
      type: TodoListChangeType.Insert,
      todoList: list,
    );
  }

  void remove(String id) {
    Todo todo = find(id);
    if (todo == null) {
      assert(false, 'Todo with $id is not exist');
      return;
    }
    int index = _todoList.indexOf(todo);
    List<Todo> clonedList = List.from(_todoList);
    _todoList.removeAt(index);
    _dbProvider.remove(todo);
    value = TodoListChangeInfo(
      insertOrRemoveIndex: index,
      type: TodoListChangeType.Delete,
      todoList: clonedList,
    );
  }

  void update(Todo todo) {
    _sort();
    _dbProvider.update(todo);
    value = TodoListChangeInfo(
      type: TodoListChangeType.Update,
      todoList: list,
    );
  }

  Todo find(String id) {
    int index = _todoList.indexWhere((todo) => todo.id == id);
    return index >= 0 ? _todoList[index] : null;
  }

  /// 对 TodoList 进行排序
  /// 排序规则：
  /// 1.未完成的Todo需要排在已完成的Todo之前
  /// 2.标星的Todo需要排在未标星的Todo之前
  /// 3.高优先级的Todo在低优先级的Todo之前
  /// 4.日期较早的Todo排在日期较晚的Todo之前
  /// 5.结束日期较早的Todo排在结束日期较晚的Todo之前
  void _sort() {
    _todoList.sort((Todo a, Todo b) {
      if (!a.isFinished && b.isFinished) {
        return -1;
      }
      if (a.isFinished && !b.isFinished) {
        return 1;
      }
      if (a.isStar && !b.isStar) {
        return -1;
      }
      if (!a.isStar && b.isStar) {
        return 1;
      }
      if (a.priority.isHigher(b.priority)) {
        return -1;
      }
      if (b.priority.isHigher(a.priority)) {
        return 1;
      }
      int dateCompareResult = b.date.compareTo(a.date);
      if (dateCompareResult != 0) {
        return dateCompareResult;
      }
      return a.endTime.hour - b.endTime.hour;
    });
  }

  Future<void> syncWithNetwork() async {
    FetchListResult result = await NetworkClient.instance().fetchList(userKey);
    if (result.error.isEmpty) {
      if (_dbProvider.editTime.isAfter(result.timestamp)) {
        await NetworkClient.instance().uploadList(list, userKey);
      } else {
        List.from(_todoList).forEach((e) => remove(e.id));
        result.data.forEach((e) => add(e));
      }
    }
  }
}
