import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  String _selectedType = 'Personal';
  String _selectedTag = 'Urgent';

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
      setState(() {
        _selectedEndTime = pickedTime;
      });
    }
  }

  void _submitForm() {
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
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Date'),
                subtitle: Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('Start Time'),
                subtitle: Text(_selectedStartTime.format(context)),
                onTap: () => _selectStartTime(context),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('End Time'),
                subtitle: Text(_selectedEndTime.format(context)),
                onTap: () => _selectEndTime(context),
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
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
