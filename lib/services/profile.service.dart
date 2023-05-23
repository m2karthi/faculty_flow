import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> getProfile() async {
    try {
final User? currentUser = _auth.currentUser;
      final String? userId = currentUser?.uid;

      final DocumentSnapshot<Map<String, dynamic>> profileDoc =
          await _firestore.collection('profile').doc(userId).get();

      if (!profileDoc.exists || profileDoc.data() == null) {
        // Document doesn't exist or data is null
        return {};
      }

      final Map<String, dynamic> profileData = profileDoc.data()!;

      print("Profile data $profileData");
      return profileData;
    } catch (e) {
      // Handle the error
      print('Error retrieving profile: $e');
      return {};
    }
  }
}
