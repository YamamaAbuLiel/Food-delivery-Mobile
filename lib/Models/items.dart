import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  String itemId;
  String itemName;
  double itemPrice;
  String itemCategory;
  String itemImage;

  Items({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.itemCategory,
    required this.itemImage,
  });

  factory Items.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Items(
      itemId: snapshot["itemId"],
      itemName: snapshot["name"],
      itemPrice: (snapshot["price"] as num).toDouble(),
      itemCategory: snapshot["category"],
      itemImage: snapshot["imageUrl"],
    );
  }
}
