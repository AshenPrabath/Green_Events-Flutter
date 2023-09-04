import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
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
        // Handle back button press here, if needed.
        return true; // Set to true to allow back navigation, or false to block it.
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: const Color(0xFFD1E8D4),
            child: AppBar(
              backgroundColor: const Color(0xFFD1E8D4),
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
                    const Text('Event Title'),
                    TextField(
                      controller: eventController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Give a title to the event',
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Date'),
                              TextField(
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Enter the date',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                  ),
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
                              const Text('Time'),
                              TextField(
                                controller: timeController,
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter the time',
                                  suffixIcon: Icon(Icons.access_time),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Text('Venue'),
                    TextField(
                      controller: venueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Short sub-title to the event',
                        suffixIcon: Icon(Icons.location_on_outlined),
                      ),
                    ),
                    const Text('Description'),
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
                    const Text('External URL'),
                    TextField(
                      controller: urlController,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Paste external URL',
                        suffixIcon: Icon(Icons.link),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006D3E),
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD1E8D4),
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

void main() {
  runApp(const MaterialApp(
    home: Addevent_ticketPage(),
  ));
}
