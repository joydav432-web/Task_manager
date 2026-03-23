import 'package:flutter/material.dart';
import 'package:task_manager/screens/new_task_cancel.dart';
import 'package:task_manager/screens/new_task_completed.dart';
import 'package:task_manager/screens/new_task_progress.dart';
import 'package:task_manager/screens/new_task_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {

  int _selectedIndex = 0;
  List _screens = [
    NewTaskScreen(),
    NewTaskProgress(),
    NewTaskCompleted(),
    NewTaskCancel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[
        _selectedIndex
      ],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
          onDestinationSelected: (int index){
          setState(() {
            _selectedIndex=index;
          });
          },


          destinations:[
            NavigationDestination(icon: Icon(Icons.task), label: 'new'),
            NavigationDestination(icon: Icon(Icons.refresh), label: 'progress'),
            NavigationDestination(icon: Icon(Icons.task_alt_outlined), label: 'completed'),
            NavigationDestination(icon: Icon(Icons.cancel_outlined), label: 'Cancel'),
          ] ),
    );
  }
}
