import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:nsbm_eventmanagentapplication/view/addtickets.dart';
import 'package:nsbm_eventmanagentapplication/view/input_textfield.dart';

void main() {
  runApp(const MaterialApp(
    home: Addevent_ticketPage(),
  ));
}

class TimeLine extends StatelessWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(''),
    );
  }
}

// ignore: camel_case_types
class Addevent_ticketPage extends StatefulWidget {
  const Addevent_ticketPage({Key? key}) : super(key: key);

  @override
  State<Addevent_ticketPage> createState() => _Addevent_ticketPageState();
}

// ignore: camel_case_types
class _Addevent_ticketPageState extends State<Addevent_ticketPage> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Addevent_ticketPage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Addevent_ticketPage();

  File? _selectedImage;

  TextEditingController eventController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  String eventTitle = '';

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        timeController.text = "${pickedTime.hour}:${pickedTime.minute}";
      });
    }
  }

  @override
  void dispose() {
    eventController.dispose();
    dateController.dispose();
    timeController.dispose();
    venueController.dispose();
    descriptionController.dispose();
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: AppBar(
               backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              title: const Text('Add Event'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xFFBFC9C0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  child: InkWell(
                    onTap: () {
                      _pickImage();
                    },
                    child: Center(
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!)
                          : const Icon(
                              Icons.add_a_photo_outlined,
                              size: 30.0,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputTextField(
                      labelText: "Event Title",
                      hint: "Give a title to the event",
                      onChanged: (text) {
                        setState(() {
                          eventTitle = text;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: eventController,
                    ),
                    const SizedBox(height: 16), 
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: TextFormField(
                                  readOnly: true,
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                    labelText: 'Date',
                                    hintText: 'Select the date',
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _selectTime(context);
                                },
                                child: TextFormField(
                                  readOnly: true,
                                  controller: timeController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Time',
                                    hintText: 'Select the time',
                                    suffixIcon: Icon(Icons.access_time),
                                  ),
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), 
                    InputTextField(
                      labelText: 'Venue',
                      onChanged: (value) {},
                      controller: venueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Short sub-title to the event',
                      ),
                      suffixIcon: Icons.location_on_outlined,
                    ),
                    const SizedBox(height: 16), 
                    const Text('Description'),
                    const SizedBox(height: 16), 
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16), 
                    InputTextField(
                      labelText: 'External URL',
                      onChanged: (value) {},
                      controller: venueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Paste external URL',
                      ),
                      suffixIcon: Icons.link,
                    ),
                    const SizedBox(height: 16), 
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                         backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: const Text(
                          'Publish As a free event',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8), 
                    const Center(
                      child: Text('or'),
                    ),
                    const SizedBox(height: 8), 
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddticketsPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                           backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: const Text(
                          'Add Tickets',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
