import 'package:morgan_e_commerce/Services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String docId}) async {
    await firestore.collection(path).doc(docId).set(data);
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    final data = await firestore.collection(path).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isDataExist({required String path, required String docId}) async {
    final data =  await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
