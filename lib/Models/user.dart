import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId;
  String userName;
  String userEmail;
  String userPhone;
  String userAddress;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userAddress,
  });

  // Validate phone number


  // To Get Data from Firebase
  factory UserModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      userId: snapshot["userId"],
      userName: snapshot["userName"],
      userEmail: snapshot["userEmail"],
  userPhone: snapshot["userPhone"],
  userAddress: snapshot["userAddress"],
  );
}

  // Send Data to Firebase
  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userName": userName,
    "userEmail": userEmail,
    "userPhone": userPhone,
    "userAddress":userAddress,

  };
}
