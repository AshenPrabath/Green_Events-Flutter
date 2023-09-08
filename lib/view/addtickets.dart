import 'package:flutter/material.dart';

class AddticketsPage extends StatefulWidget {
  const AddticketsPage({Key? key}) : super(key: key);

  @override
  State<AddticketsPage> createState() => _AddticketPageState();
}

class _AddticketPageState extends State<AddticketsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add tickets"),
        backgroundColor: const Color(0xFFD1E8D4),
        actions: [
          TextButton(
            onPressed: () {
              
            },
            style: TextButton.styleFrom(
             
              // ignore: deprecated_member_use
              primary: const Color(0xFF006D3E),
            ),
            child: const Text(
              "Publish",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
        },
        backgroundColor: const Color(0xFFEFE9F5), 
        child: const Icon(
          Icons.add,
          color: Color(0xFF006D3E), 
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
