import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moorlocal/data/moor_database.dart';

void main() {
  runApp(Orders());
}

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Orders List"),
        ),
        body: SingleChildScrollView(child: NewOrder()),
      ),
    );
  }
}

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: 'Product Name'),
          keyboardType: TextInputType.text,
          controller: productNameController,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Product Price'),
          keyboardType: TextInputType.number,
          controller: priceController,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              AppDatabase().insertNewOrder(Order(
                price: priceController.text,
                productName: productNameController.text,
              ));

              priceController.clear();
              productNameController.clear();
            });
          },
          color: Colors.green,
          child: Text("Place Order"),
        ),
        Container(
          height: 700,
          width: double.infinity,
          child: StreamBuilder(
            stream: AppDatabase().watchAllOrder(),
            builder: (context, AsyncSnapshot<List<Order>> snapshot) {
              return ListView.builder(
                itemBuilder: (_, index) {
                  return Card(
                    color: Colors.orangeAccent,
                    child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                          radius: 20,
                        ),
                        title: Text(snapshot.data[index].productName),
                        subtitle: Text("Rs. ${snapshot.data[index].price}"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            setState(() {
                              AppDatabase().deleteOrder(snapshot.data[index]);
                            });
                          },
                          color: Colors.red,
                        )),
                  );
                },
                itemCount: snapshot.data.length,
              );
            },
          ),
        )
      ],
    );
  }
}
