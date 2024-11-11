import 'package:crud_app/services/database.dart';
import 'package:crud_app/widgets/add_employee.dart';
import 'package:crud_app/widgets/all_employee.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  getloaddata() async {
    employyestream = await Database().getemployeeinfo();
    setState(() {});
  }

  @override
  void initState() {
    getloaddata();
    super.initState();
  }

  @override
  void dispose() {
    addnamecontroller.dispose();
    addagecontroller.dispose();
    addlocationcontroller.dispose();
    namecontroller.dispose();
    agecontroller.dispose();
    locationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FireBase Crud',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          addemployee(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Expanded(child: allemployeeData()),
          ],
        ),
      ),
    );
  }
}
