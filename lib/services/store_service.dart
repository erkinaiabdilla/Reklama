import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reklama/models/information.dart';

class StoreServise {
  final db = FirebaseFirestore.instance;
  Future<void> informationSave(Information information) async {
    await db.collection('Reklama').add(information.toMap());
  }
}
