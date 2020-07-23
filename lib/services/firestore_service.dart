import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fAdd/models/product.dart';


class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> saveProduct(Product product){
    return _db.collection('products').document(product.productId).setData(product.toMap());
  }
}