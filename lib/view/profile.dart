import 'dart:ui';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

 class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const Center(
          child: ProfileCard(),
        ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/pro.jpg'), // Replace with your image path
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dilshan Perera',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'wdrdperera@students.nsbm.ac.lk',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Personal Info',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 95, 205, 99),
            ),
          ),
          SizedBox(height: 16.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),  
            SizedBox(height: 1.0,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0715624813',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.edit,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ],
              ),
            
          
          SizedBox(height: 16.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Faculty',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                'Faculty of Computing', // Replace with the actual faculty name
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
         
          const SizedBox(height: 16.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Organization',
                style: TextStyle(
                   fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 95, 205, 99),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            width: double.infinity, 
            height: 50.0,// Makes the button take the full width
            child: ElevatedButton(
              onPressed: () {
               // Add your button click action here
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 238, 241, 244), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded edges
                ),
              ),
              child: Text('Add an Organization'),
            ),
          ),
        ],
      ),
    );
  }
}
