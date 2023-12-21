import 'package:flutter/material.dart';
import '../Models/items.dart';
import '../Widgets/app_bar_widget.dart';
import '../services/items.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ItemsService itemsService = ItemsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(head: "Main Page"),
      body: FutureBuilder(
        future: itemsService.getItems(),
        //Depending on the states of snapshot display the proper UI
        builder: (context, AsyncSnapshot<List<Items>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            //Handel if the data might be null "Null-aware operator"
            List<Items> items = snapshot.data ?? [];

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Items item = items[index];
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
                    width: 100.0, // Set width as needed
                    height: 150.0, // Set height as needed
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    // Handle item tap if needed
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
