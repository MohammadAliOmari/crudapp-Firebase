import 'package:crud_app/services/database.dart';
import 'package:crud_app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

Future deleteEmployee(String id, context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text('Are you sure need to delete it'),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  IconButton(
                    onPressed: () async {
                      await Database().deleteEmployeeData(id);
                      if (!context.mounted) return;
                      // Only execute this if the widget is still mounted
                      snackbar(
                          msg: 'Deleted Successfully', bgcolor: Colors.red);

                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.check),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
