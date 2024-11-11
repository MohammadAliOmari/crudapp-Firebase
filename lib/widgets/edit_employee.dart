import 'package:crud_app/services/database.dart';
import 'package:crud_app/widgets/all_employee.dart';
import 'package:crud_app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

Future editemployee(
  String id,
  context,
) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          content: SizedBox(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context)),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: namecontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                const Text(
                  'Age',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: agecontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                const Text(
                  'Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: locationcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          // Collect updated information from controllers
                          Map<String, dynamic> updatedInfo = {
                            'Name': namecontroller.text,
                            'Age': agecontroller.text,
                            'id': id.toString(),
                            'Location': locationcontroller.text,
                          };

                          // Perform the update operation asynchronously
                          await Database()
                              .updateEmployeeDetails(id, updatedInfo);

                          // Check if the widget is still mounted before performing further actions
                          if (!context.mounted) return;

                          // Only execute this if the widget is still mounted
                          snackbar(
                              msg: 'Updated Successfully',
                              bgcolor: Colors.green);

                          Navigator.pop(context);
                        },
                        child: const Text('Update')))
              ],
            ),
          ),
        );
      },
    );
