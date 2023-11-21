import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationPage(),
    );
  }
}

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Authentication logic goes here
    return Container();
  }
}

class Task {
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task({required this.title, required this.description, required this.dueDate, this.isCompleted = false});
}

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  // Add methods for editing/deleting tasks if needed
}

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskProvider>(context).tasks;

    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => Divider(), // Add dividers
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].description),
          onTap: () {
            // Navigate to TaskDetailPage or implement task editing here
          },
        );
      },
    );
  }
}

class TaskDetailPage extends StatelessWidget {
  final Task task;

  TaskDetailPage({required this.task});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for displaying task details
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title: ${task.title}'),
          Text('Description: ${task.description}'),
          Text('Due Date: ${task.dueDate}'),
          // Add more details as needed
        ],
      ),
    );
  }
}
