import 'package:flutter/material.dart';
import 'package:todo_list/config/colors.dart';
import 'package:todo_list/pages/todo_list.dart';

class TodoEntryPage extends StatefulWidget {
  const TodoEntryPage({Key key}) : super(key: key);

  @override
  _TodoEntryPageState createState() => _TodoEntryPageState();
}

class _TodoEntryPageState extends State<TodoEntryPage> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String imagePath, {
    double size,
    bool singleImage = false,
  }) {
    if (singleImage) {
      return BottomNavigationBarItem(
        icon: Image(
          width: size,
          height: size,
          image: AssetImage(imagePath),
        ),
        label: '',
      );
    }
    ImageIcon activeIcon = ImageIcon(
      AssetImage(imagePath),
      size: size,
      color: activeTabIconColor,
    );
    ImageIcon inactiveImageIcon = ImageIcon(
      AssetImage(imagePath),
      size: size,
      color: inactiveTabIconColor,
    );
    return BottomNavigationBarItem(
      activeIcon: activeIcon,
      icon: inactiveImageIcon,
      label: '',
    );
  }

  _onTabChange(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabChange,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem('assets/images/lists.png'),
          _buildBottomNavigationBarItem('assets/images/calendar.png'),
          _buildBottomNavigationBarItem(
            'assets/images/add.png',
            size: 50,
            singleImage: true,
          ),
          _buildBottomNavigationBarItem('assets/images/report.png'),
          _buildBottomNavigationBarItem('assets/images/about.png'),
        ],
      ),
      body: TodoListPage(),
    );
  }
}
