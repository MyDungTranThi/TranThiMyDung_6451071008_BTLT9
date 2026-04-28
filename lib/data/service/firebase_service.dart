import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference getCategoryCollection() {
    return firestore.collection('categories');
  }

  static CollectionReference getProductCollection() {
    return firestore.collection('products');
  }
}