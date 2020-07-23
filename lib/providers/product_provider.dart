import 'package:fAdd/models/product.dart';
import 'package:fAdd/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier{
  final firestoreService=FirestoreService();
 String _name;
  double _price;
  String _productId;
  var uuid=Uuid();
  //Getters
  String get name => _name;
  double get price => _price;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  } 
  saveProduct(){
    //print("$name,$price");
   var newProduct =Product(name: name,price: price,productId: uuid.v4());
   firestoreService.saveProduct(newProduct);
  }
}