import 'package:flutter/material.dart';
import 'package:task_management/screens/add_task.dart';
import 'package:task_management/screens/all_workers.dart';
import 'package:task_management/screens/profile.dart';
import 'package:task_management/screens/tasks_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Icon(
                  Icons.free_breakfast_outlined,
                  size: 30,
                  color: Colors.pinkAccent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Taskish',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TasksScreen()));
            },
            leading: Icon(Icons.file_copy),
            title: Text(
              'All Tasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            leading: Icon(Icons.account_box),
            title: Text(
              'My account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllWorkersScreen()));
            },
            leading: Icon(Icons.share),
            title: Text(
              'Registered Workers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UploadTask()));
            },
            leading: Icon(Icons.add_a_photo),
            title: Text(
              'Add Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Row(
                        children: [
                          Image.network(
                            'https://image.flaticon.com/icons/png/128/1252/1252006.png',
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Sign out'),
                          ),
                        ],
                      ),
                      content: Text('Do you wanna sign out ? '),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('No'),
                        ),
                      ],
                    );
                  });
            },
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
