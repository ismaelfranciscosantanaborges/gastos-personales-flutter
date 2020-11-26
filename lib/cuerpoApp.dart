import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CuerpoAppPage extends StatefulWidget {
  _CuerpoApp createState() => _CuerpoApp();
}

class _CuerpoApp extends State<CuerpoAppPage> {
  TextEditingController _nameController;
  TextEditingController _priceController;
  List<Card> cart = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _priceController.dispose();
  }

  void agregarCart() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Text(
              'CRART',
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  nameFields(),
                  SizedBox(height: 10),
                  amountFields(),
                  SizedBox(height: 10),
                  sumitButton(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, int index) {
                  return Card(
                    child: Column(
                      children: [cart[index]],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nameFields() {
    return TextFormField(
      controller: _nameController,
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Title'),
    );
  }

  Widget amountFields() {
    return TextFormField(
      controller: _priceController,
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Amount'),
    );
  }

  Widget sumitButton() {
    return FlatButton(
      color: Colors.white,
      child: Text(
        'Insertar',
        style: TextStyle(color: Colors.purple),
      ),
      onPressed: () {
        double price = double.tryParse(_priceController.text);
        if (_nameController.text.length < 1 || price == null) return;

        setState(() {
          final dateString = DateFormat.yMMMMEEEEd().format(DateTime.now());
          // final dateString = format.format(DateTime.now());
          cart.add(
            Card(
              child: ListTile(
                title: Text(_nameController.text,
                    style: TextStyle(fontWeight: FontWeight.w700)),
                subtitle: Text(dateString),
                leading: Container(
                  height: 40,
                  width: 80,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Text('\$$price',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          );
          _nameController.text = '';
          _priceController.text = '';
        });
      },
    );
  }
}
