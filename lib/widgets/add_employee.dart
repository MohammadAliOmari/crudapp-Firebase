import 'package:crud_app/services/database.dart';
import 'package:crud_app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

TextEditingController addnamecontroller = TextEditingController();
TextEditingController addagecontroller = TextEditingController();
TextEditingController addlocationcontroller = TextEditingController();
Future addemployee(
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
                      'add',
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
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: addnamecontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                const Text(
                  'Age',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: addagecontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                const Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: addlocationcontroller,
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

                          // Perform the update operation asynchronously
                          String id = randomString(10);
                          Map<String, dynamic> employeeinfo = {
                            'Name': addnamecontroller.text,
                            'Age': addagecontroller.text,
                            'id': id.toString(),
                            'Location': addlocationcontroller.text,
                          };
                          await Database()
                              .addEmployeeDetaiels(employeeinfo, id)
                              .then(
                            (value) {
                              if (!context.mounted) return;

                              // Only execute this if the widget is still mounted
                              snackbar(
                                  msg: 'Added Successfully',
                                  bgcolor: Colors.green);
                              addnamecontroller.clear();
                              addagecontroller.clear();
                              addlocationcontroller.clear();
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: const Text('Add')))
              ],
            ),
          ),
        );
      },
    );
