import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/Models/items.dart';

class ItemsService {
  final CollectionReference itemsCollection = FirebaseFirestore.instance.collection('items');

  Future<List<Items>> getItems() async {
    try {
      QuerySnapshot querySnapshot = await itemsCollection.get();

      List<Items> itemsList = querySnapshot.docs.map((doc) {
        return Items.fromSnapshot(doc);
      }).toList();

      return itemsList;
    } catch (e) {
      print("Error getting items: $e");
      throw e;
    }
  }
}

