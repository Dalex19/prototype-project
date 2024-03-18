import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  static Future<UserCredential?> registerUser(String email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> writeInDB(String uid, email, role) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentReference<Map<String, dynamic>> myDb =
        firestore.collection("usuarios").doc(uid);

     myDb.set({"email": email, "role": role});
  }
}
