import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

//* * * * * * * * * * * * * * * Get Todays Task *************
  Future getAppointment() async {
    try {
      // Get the current user's ID
      final User? currentUser = _auth.currentUser;
      final String? userId = currentUser?.uid;
      print("Todays Task getTodayTasksgetTodayTasksgetTodayTasks $userId");

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('meetings')
          .doc(userId)
          .get();

      if (!snapshot.exists) {
        throw Exception('Document not found');
      }

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      List<dynamic> tasks = data['meeting'];
      print("qqqqqq getTodayTasksgetTodayTasksgetTodayTasks $tasks");

      return tasks;
    } catch (e) {
      // Handle the error
      print('Error retrieving today tasks: $e');
      return [];
    }
  }

  //* Add new Task
  Future<void> addMeeting(meetingDetails) async {
    try {
      // Get the current user's ID
      final User? currentUser = _auth.currentUser;
      final String? userId = currentUser?.uid;

      print("task page UID $userId");
      // Create a reference to the user's document in the 'tasks' collection
      final DocumentReference userDocRef =
          _firestore.collection('meetings').doc(userId);

      // Fetch the user's document data
      final DocumentSnapshot userDocSnapshot = await userDocRef.get();

      if (userDocSnapshot.exists) {
        // User document already exists, update the 'tasks' array with new task details
        await userDocRef.update({
          'meeting': FieldValue.arrayUnion([meetingDetails]),
        });
      } else {
        // User document does not exist, create a new document with the 'tasks' array
        await userDocRef.set({
          'meeting': [meetingDetails],
        });
      }
    } catch (e) {
      print('Error adding meetings: $e');
      // Handle the error according to your app's needs
    }
  }

  Future<dynamic> approved(suggestionId, approvedAt) async {
    final User? currentUser = _auth.currentUser;
    final String? userId = currentUser?.uid;
    final DocumentReference userDocRef =
        _firestore.collection('meetings').doc(userId);
    await userDocRef.update({'status': 'Approved', 'approvedAt': approvedAt});
  }

  Future<dynamic> rejected(suggestionId, rejectedAt) async {
    final User? currentUser = _auth.currentUser;
    final String? userId = currentUser?.uid;
    final DocumentReference userDocRef =
        _firestore.collection('meetings').doc(userId);
    await userDocRef.update({'status': 'Rejected', 'rejectedAt': rejectedAt});
  }
}
