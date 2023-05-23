import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

//* * * * * * * * * * * * * * * Get Todays Task *************
  Future getTodayTasks() async {
    try {
      // Get the current user's ID
      final User? currentUser = _auth.currentUser;
      final String? userId = currentUser?.uid;
      print("Todays Task getTodayTasksgetTodayTasksgetTodayTasks $userId");

      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('tasks').doc(userId).get();

      if (!snapshot.exists) {
        throw Exception('Document not found');
      }

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      List<dynamic> tasks = data['tasks'];
      print("qqqqqq getTodayTasksgetTodayTasksgetTodayTasks $tasks");

      return tasks;

       
    } catch (e) {
      // Handle the error
      print('Error retrieving today tasks: $e');
      return [];
    }
  }

  //* Add new Task
  Future<void> addTask(taskDetails) async {
    try {
      // Get the current user's ID
      final User? currentUser = _auth.currentUser;
      final String? userId = currentUser?.uid;

      print("task page UID $userId");
      // Create a reference to the user's document in the 'tasks' collection
      final DocumentReference userDocRef =
          _firestore.collection('tasks').doc(userId);

      // Fetch the user's document data
      final DocumentSnapshot userDocSnapshot = await userDocRef.get();

      if (userDocSnapshot.exists) {
        // User document already exists, update the 'tasks' array with new task details
        await userDocRef.update({
          'tasks': FieldValue.arrayUnion([taskDetails]),
        });
      } else {
        // User document does not exist, create a new document with the 'tasks' array
        await userDocRef.set({
          'tasks': [taskDetails],
        });
      }
    } catch (e) {
      print('Error adding task: $e');
      // Handle the error according to your app's needs
    }
  }
}
