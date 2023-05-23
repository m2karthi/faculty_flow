import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/task.service.dart';
import '../widgets/appbar.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TaskService taskService = TaskService();
  String _selectedType = 'Personal';
  String _selectedTag = 'Urgent';

  //   title: 'Shopping',
  //   description: 'Buy groceries',
  //   date: DateTime(2023, 5, 22),
  //   startTime: TimeOfDay(hour: 9, minute: 0),
  //   endTime: TimeOfDay(hour: 10, minute: 0),
  //   type: 'Personal',
  //   tags: 'Low',
  //   status: 'OnRequest',
  //   updatedAt: DateTime.now(),

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedStartTime = TimeOfDay.now();
  TimeOfDay _selectedEndTime = TimeOfDay.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

    void _selectStartTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedStartTime,
      );

      if (pickedTime != null && pickedTime != _selectedStartTime) {
        setState(() {
          _selectedStartTime = pickedTime;
        });
      }
    }

    void _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedEndTime,
    );

    if (pickedTime != null && pickedTime != _selectedEndTime) {
      // Check if the selected end time is greater than or equal to the selected start time
      if (_selectedStartTime != null &&
          (pickedTime.hour < _selectedStartTime!.hour ||
              (pickedTime.hour == _selectedStartTime!.hour &&
                  pickedTime.minute < _selectedStartTime!.minute))) {
                    // Reset the end time
        setState(() {
          _selectedEndTime = _selectedStartTime;
        });
        // Display an error message or handle the invalid selection
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Time Selection'),
              content: Text(
                  'The selected end time must be greater than or equal to the start time.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return; // Exit the function without updating the selected end time
      }

      setState(() {
        _selectedEndTime = pickedTime;
      });
    }
  }


  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Perform the task submission logic here
      // Access the entered values using the text controllers and selected values
      String title = _titleController.text;
      String description = _descriptionController.text;

      // Print the entered values (Replace with your own logic)
      print('Title: $title');
      print('Description: $description');
      print('Date: $_selectedDate');
      print('Start Time: $_selectedStartTime');
      print('End Time: $_selectedEndTime');
      print('Type: $_selectedType');
      print('Tag: $_selectedTag');

      String status;
      DateTime now = DateTime.now();
      DateTime taskDate = _selectedDate;

      if (taskDate.isBefore(now)) {
        // Task date is in the past
        status = 'Completed';
      } else if (taskDate.isAtSameMomentAs(now)) {
        // Task date is today
        status = 'Active';
      } else {
        // Task date is in the future
        status = 'Pending';
      }

      String convertTimeOfDayToString(TimeOfDay timeOfDay) {
        final hour = timeOfDay.hour.toString().padLeft(2, '0');
        final minute = timeOfDay.minute.toString().padLeft(2, '0');
        return '$hour:$minute';
      }
      
      var taskId = '${title}_${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}';


      var taskDetails = {
        'id': taskId,
        'title': title,
        'description': description,
        'date': _selectedDate,
        'startTime': convertTimeOfDayToString(_selectedStartTime),
        'endTime': convertTimeOfDayToString(_selectedEndTime),
        'type': _selectedType,
        'tag': _selectedTag,
        'createdAt': DateTime.now(),
        'status': status,
      };

      print("TaskDetails $taskDetails");
      await taskService.addTask(taskDetails).then((_) {
        // Task added successfully, perform any additional action
         // Clear the task details after adding the task
        setState(() {
          _titleController.clear();
          _descriptionController.clear();
          _selectedDate = DateTime.now();
          _selectedStartTime = TimeOfDay(hour: 0, minute: 0);
          _selectedEndTime = TimeOfDay(hour: 0, minute: 0);
          _selectedType = 'Personal';
          _selectedTag = 'Urgent';
        });
        print('Task added successfully');
         Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavBar()),
        );
      }).catchError((error) {
        // Error occurred while adding task, handle the error
        print('Error adding task: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "Add Task",
              style: GoogleFonts.hindSiliguri(
                fontWeight: FontWeight.w600,
                fontSize: 29,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        isDense: true,
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Color(0XFF757575)),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0XFF757575)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF757575)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.0),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Date'),
                      subtitle: Text(
                        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                      ),
                      onTap: () => _selectDate(context),
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.access_time),
                            title: Text('Start Time'),
                            subtitle: Text(_selectedStartTime.format(context)),
                            onTap: () => _selectStartTime(context),
                          ),
                        ),
                        // SizedBox(height: 16.0),
                        Expanded(
                          child: ListTile(
                            leading: Icon(Icons.access_time),
                            title: Text('End Time'),
                            subtitle: Text(_selectedEndTime.format(context)),
                            onTap: () => _selectEndTime(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        isDense: false,
                        prefixIcon: Icon(Icons.description_outlined,
                            color: Color(0XFF757575)),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0XFF757575)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF757575)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Type',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Personal',
                          groupValue: _selectedType,
                          onChanged: (value) {
                            setState(() {
                              _selectedType = value!;
                            });
                          },
                        ),
                        Text('Personal'),
                        SizedBox(width: 16.0),
                        Radio<String>(
                          value: 'Work',
                          groupValue: _selectedType,
                          onChanged: (value) {
                            setState(() {
                              _selectedType = value!;
                            });
                          },
                        ),
                        Text('Work'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Tags',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: [
                        ChoiceChip(
                          label: Text('Urgent'),
                          selected: _selectedTag == 'Urgent',
                          onSelected: (selected) {
                            setState(() {
                              _selectedTag = 'Urgent';
                            });
                          },
                          selectedColor: Colors.red,
                        ),
                        ChoiceChip(
                          label: Text('High'),
                          selected: _selectedTag == 'High',
                          onSelected: (selected) {
                            setState(() {
                              _selectedTag = 'High';
                            });
                          },
                          selectedColor: Colors.orange,
                        ),
                        ChoiceChip(
                          label: Text('Normal'),
                          selected: _selectedTag == 'Normal',
                          onSelected: (selected) {
                            setState(() {
                              _selectedTag = 'Normal';
                            });
                          },
                          selectedColor: Colors.green,
                        ),
                        ChoiceChip(
                          label: Text('Low'),
                          selected: _selectedTag == 'Low',
                          onSelected: (selected) {
                            setState(() {
                              _selectedTag = 'Low';
                            });
                          },
                          selectedColor: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Color(0XFF7059DE),
                        // minimumSize: Size(350, 43),
                      ),
                      child: Text(
                        'Add Task',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
