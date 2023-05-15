import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  String _selectedType = 'Personal';
  List<String> _selectedTags = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the task submission logic here
      // Access the entered values using the text controllers
      String title = _titleController.text;
      String date = _dateController.text;
      String startTime = _startTimeController.text;
      String endTime = _endTimeController.text;
      String description = _descriptionController.text;

      // Print the entered values (You can replace this with your logic)
      print('Title: $title');
      print('Date: $date');
      print('Start Time: $startTime');
      print('End Time: $endTime');
      print('Description: $description');
      print('Type: $_selectedType');
      print('Tags: $_selectedTags');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _startTimeController,
                      decoration: InputDecoration(
                        labelText: 'Start Time',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a start time';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: _endTimeController,
                      decoration: InputDecoration(
                        labelText: 'End Time',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an end time';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
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
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: Text('Urgent'),
                    selected: _selectedTags.contains('Urgent'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedTags.add('Urgent');
                        } else {
                          _selectedTags.remove('Urgent');
                        }
                      });
                    },
                  ),
                  FilterChip(
                    label: Text('Important'),
                    selected: _selectedTags.contains('Important'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedTags.add('Important');
                        } else {
                          _selectedTags.remove('Important');
                        }
                      });
                    },
                  ),
                  FilterChip(
                    label: Text('EOD'),
                    selected: _selectedTags.contains('EOD'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedTags.add('EOD');
                        } else {
                          _selectedTags.remove('EOD');
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

