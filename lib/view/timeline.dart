import "package:flutter/material.dart";

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("timeline"),),
      body: Center(
        child: Text("timeline screen", style: TextStyle(fontSize: 40),),
      ),
    );
  }
}