import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Models/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<bool> checkForDuplicatePhone(String mobile) async {
    try {
      QuerySnapshot querySnapshot = await users.where('userPhone', isEqualTo: mobile).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking for duplicate phone number: $e");
      return true; // Assume it's a duplicate to be cautious
    }
  }

  bool isPhoneNumberValid(String phone) {
    // Add your phone number validation logic here
    String phonePattern = r'^059\d{7}$';
    RegExp regex = RegExp(phonePattern);
    return regex.hasMatch(phone);
  }

  getUserDetails()async{
    User currentUser=_auth.currentUser!;
    DocumentSnapshot documentSnapshot= await users.doc(currentUser.uid).get();
    return UserModel.fromSnap(documentSnapshot);
  }

  Future<String> signup({
    required String userName,
    required String userEmail,
    required String userPhone,
    required String password,
    required String userAddress
  }) async {
    try {
      if (userEmail.isNotEmpty && userPhone.isNotEmpty && userName.isNotEmpty && password.isNotEmpty ||userAddress.isNotEmpty) {
        // Validate phone number format
        if (!isPhoneNumberValid(userPhone)) {
          return "Invalid phone number format";
        }

        // Check for duplicate phone number
        bool isDuplicatePhone = await checkForDuplicatePhone(userPhone);
        if (isDuplicatePhone) {
          return "Phone number is already in use";
        }

        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: userEmail, password: password);
        UserModel userModel = UserModel(userId: userCredential.user!.uid, userName: userName, userEmail: userEmail, userPhone: userPhone,userAddress: userAddress);
        await users.doc(userCredential.user!.uid).set(userModel.toJson());

        return "Success";
      } else {
        return "Enter All Fields";
      }
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    } on Exception catch (e) {
      return e.toString() ?? "An error occurred";
    }
  }

  Future<String> signin({required String userEmail, required String password}) async {
    String res = "some error";
    try {
      if (userEmail.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: userEmail, password: password);
        res = "Success";
      } else {
        res = "Enter All Fields";
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions here
      print("FirebaseAuthException: ${e.message}");
      res = "Email or password are not correct ";
    } on Exception catch (e) {
      // Handle other generic exceptions here
      print("Exception: $e");
      res = "An unexpected error occurred";
    }
    return res;
  }

}

