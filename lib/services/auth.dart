import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Models/user.dart';

class AuthMethods {
  //To handle user authentication and Firebase Firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection(
      "users");

//Check if the phone number is duplicated in DB
  Future<bool> checkForDuplicatePhone(String mobile) async {
    try {
      QuerySnapshot querySnapshot = await users.where(
          'userPhone', isEqualTo: mobile).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking for duplicate phone number: $e");
      return true;
    }
  }

  Future<String> signup({
    required String userName,
    required String userEmail,
    required String userPhone,
    required String password,
    required String userAddress
  }) async {
    try {
      if (userEmail.isNotEmpty && userPhone.isNotEmpty && userName.isNotEmpty &&
          password.isNotEmpty || userAddress.isNotEmpty) {
        //  Check Validattion of  phone number format
        if (!isPhoneNumberValid(userPhone)) {
          return "Invalid phone number format";
        }

        // Check for duplicate phone number
        bool isDuplicatePhone = await checkForDuplicatePhone(userPhone);
        if (isDuplicatePhone) {
          return "Phone number is already in use";
        }

        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
            email: userEmail, password: password);
        UserModel userModel = UserModel(userId: userCredential.user!.uid,
            userName: userName,
            userEmail: userEmail,
            userPhone: userPhone,
            userAddress: userAddress);
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

  Future<String> signin(
      {required String userEmail, required String password}) async {
    String res = "some error";
    try {
      if (userEmail.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: userEmail, password: password);
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

  getUserDetails() async {
    User currentUser = _auth.currentUser!;
    //take the curent data
    DocumentSnapshot documentSnapshot = await users.doc(currentUser.uid).get();
    return UserModel.fromSnap(documentSnapshot);
  }

  Future<String> editProfileData({
    required String userId,
    required String userName,
    required String userEmail,
    required String userPhone,
    required String userAddress,
  }) async {
    try {
      //Check if the user leave fields empty or enter invalid data
      if (userName.isNotEmpty && userEmail.isNotEmpty && userPhone.isNotEmpty &&
          userAddress.isNotEmpty) {
        if (!isPhoneNumberValid(userPhone)) {
          return "Invalid phone number format";
        }

        if (!isEmailValid(userEmail)) {
          return "Invalid email format";
        }

        if (await isDuplicatePhone(userId, userPhone)) {
          return "Phone number is already in use by another user";
        }
        if (await isDuplicateEmail(userId, userEmail)) {
          return "Email is already in use by another user";
        }


        await users.doc(userId).update({
          "userName": userName,
          "userEmail": userEmail,
          "userPhone": userPhone,
          "userAddress": userAddress,
        });

        return "Success";
      } else {
        return "Enter all fields";
      }
    } on Exception catch (e) {
      print(e);
      return "An error occurred";
    }
  }

  Future<bool> isDuplicatePhone(String userId, String mobile) async {
    try {
      QuerySnapshot querySnapshot = await users
          .where('userPhone', isEqualTo: mobile)
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs.isEmpty;
    } catch (e) {
      print("Error checking for duplicate phone number: $e");
      return true;
    }
  }

  Future<bool> isDuplicateEmail(String userId, String email) async {
    try {
      QuerySnapshot querySnapshot = await users
          .where('userEmail', isEqualTo: email)
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs.isEmpty;
    } catch (e) {
      print("Error checking for duplicate email: $e");
      return true;
    }
  }


  bool isPhoneNumberValid(String phone) {
    String phonePattern = r'^059\d{7}$';
    RegExp regex = RegExp(phonePattern);
    return regex.hasMatch(phone);
  }

  bool isEmailValid(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  Future<String> resetPassword({required String userEmail}) async {
    try {
      await _auth.sendPasswordResetEmail(email: userEmail);
      return "Password reset email sent. Check your email for instructions.";
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
      return "Error sending password reset email: ${e.message}";
    } on Exception catch (e) {
      print("Exception: $e");
      return "An unexpected error occurred while sending the password reset email.";
    }
  }

  signout() async {
    await _auth.signOut();
  }
}
