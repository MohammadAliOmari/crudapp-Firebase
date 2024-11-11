import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/widgets/delete_employee.dart';
import 'package:crud_app/widgets/edit_employee.dart';
import 'package:flutter/material.dart';

TextEditingController namecontroller = TextEditingController();
TextEditingController agecontroller = TextEditingController();
TextEditingController locationcontroller = TextEditingController();
Stream? employyestream;
Widget allemployeeData() {
  return StreamBuilder(
      stream: employyestream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5.0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Name : ${ds["Name"]}',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        namecontroller.text = ds['Name'];
                                        agecontroller.text = ds['Age'];
                                        locationcontroller.text =
                                            ds['Location'];

                                        editemployee(ds['id'], context);
                                      },
                                      icon: const Icon(Icons.edit),
                                      color: Colors.orange,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        deleteEmployee(ds['id'], context);
                                      },
                                      icon: const Icon(Icons.delete_outline),
                                      color: Colors.red,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              'Age :${ds['Age']}',
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Location :${ds["Location"]}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.docs.length,
              )
            : const Text('No data yet ');
      });
}
