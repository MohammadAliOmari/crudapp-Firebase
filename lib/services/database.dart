import 'package:cloud_firestore/cloud_firestore.dart';

String collection = 'Employee';

class Database {
  Future addEmployeeDetaiels(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getemployeeinfo() async {
    return FirebaseFirestore.instance.collection(collection).snapshots();
  }

  Future updateEmployeeDetails(
      String id, Map<String, dynamic> updateemployeeInfoMap) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .update(updateemployeeInfoMap);
  }

  Future deleteEmployeeData(String id) async {
    await FirebaseFirestore.instance.collection(collection).doc(id).delete();
  }
}
