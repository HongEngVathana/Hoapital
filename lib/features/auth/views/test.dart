// import 'package:flutter/material.dart';
// import 'package:hospital/features/auth/models/todoList_model.dart';

// import 'package:hospital/services/todoList_service.dart';

// void main() {
//   runApp(TodoListScreen());
// }

// class TodoListScreen extends StatefulWidget {
//   const TodoListScreen({Key? key}) : super(key: key);

//   @override
//   State<TodoListScreen> createState() => _TodoListScreenState();
// }

// class _TodoListScreenState extends State<TodoListScreen> {
//   late Future<List<TodoItem>> _todoItems;

//   @override
//   void initState() {
//     super.initState();
//     _todoItems = TodoService().fetchTodoItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To-Do List'),
//         backgroundColor: Colors.teal,
//       ),
//       body: FutureBuilder<List<TodoItem>>(
//         future: _todoItems,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No To-Do Items Found'));
//           }

//           final items = snapshot.data!;
//           return ListView.builder(
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               final item = items[index];
//               return ListTile(
//                 title: Text(item.title),
//                 subtitle: Text(item.subtitle),
//                 trailing: Text(
//                   item.status,
//                   style: TextStyle(
//                     color: item.status == 'Pending' ? Colors.red : Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.pushNamed(context, item.screen);
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
