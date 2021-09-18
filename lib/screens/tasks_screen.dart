import 'package:flutter/material.dart';
import 'package:task_management/constants/constants.dart';
import 'package:task_management/screens/widgets/drawer_widget.dart';
import 'package:task_management/screens/widgets/task_widget.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<String> taskCategory = [
    'Business',
    'Programming',
    'Information Texhnology',
    'Human Resources',
    'Marketing',
    'Design',
    'Accounting'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list_outlined),
              onPressed: () {
                _filterTasks();
              })
        ],
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return TasksWidget();
      }),
    );
  }

  _filterTasks() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Tasks Category'),
            content: ListView.builder(
                shrinkWrap: true,
                itemCount: Constants.taskCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(Constants.taskCategory[index]),
                        ),
                      ],
                    ),
                  );
                }),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text('Close'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Cancel Filter'),
              ),
            ],
          );
        });
  }
}
