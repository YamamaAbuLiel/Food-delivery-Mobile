import 'package:flutter/material.dart';
import '../Models/items.dart';
import '../services/items.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final ItemsService itemsService = ItemsService();
  List<Items> allItems = [];
  List<Items> displayedItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load all items when the widget initializes
    loadItems();
  }

  void loadItems() async {
    List<Items> items = await itemsService.getItems();
    setState(() {
      allItems = items;
      displayedItems = items;
    });
  }

  void filterItems(String query) {
    setState(() {
      displayedItems = allItems
          .where((item) =>
      item.itemName.toLowerCase().contains(query.toLowerCase()) ||
          item.itemCategory.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
        title: TextField(
          controller: searchController,
          onChanged: (query) => filterItems(query),
          decoration: InputDecoration(
            hintText: 'Search items...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform search based on the entered query
              filterItems(searchController.text);
            },
          ),
        ],
      ),
      body: displayedItems.isEmpty
          ? Center(
        child: Text('No results found.'),
      )
          : ListView.builder(
        itemCount: displayedItems.length,
        itemBuilder: (context, index) {
          Items item = displayedItems[index];
          return ListTile(
            title: Text(item.itemName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category: ${item.itemCategory}'),
                Text('Price: ₪${item.itemPrice.toStringAsFixed(2)}'),
              ],
            ),
            leading: Image.network(
              item.itemImage,
              width: 100.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            onTap: () {
              // Handle item tap if needed
            },
          );
        },
      ),
    );
  }
}
