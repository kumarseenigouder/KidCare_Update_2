import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddChildFormScreen extends StatefulWidget {
  final Map<String, String> parentDetails;

  const AddChildFormScreen({required this.parentDetails, super.key});

  @override
  State<AddChildFormScreen> createState() => _AddChildFormScreenState();
}

class _AddChildFormScreenState extends State<AddChildFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int age = 0;
  String gender = 'Male';
  String bloodGroup = '';
  File? _childImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _childImage = File(picked.path));
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {
        'name': name,
        'age': age,
        'gender': gender,
        'bloodGroup': bloodGroup,
        'appointments': [],
        'image': _childImage?.path,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Child")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _childImage != null
                          ? FileImage(_childImage!)
                          : const AssetImage('assets/images/baby.jpg')
                              as ImageProvider<Object>,
                  child:
                      _childImage == null
                          ? const Icon(Icons.add_a_photo, size: 24)
                          : null,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (val) => name = val ?? '',
                validator:
                    (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onSaved: (val) => age = int.tryParse(val ?? '') ?? 0,
                validator:
                    (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items:
                    ['Male', 'Female', 'Other']
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                onChanged: (val) => setState(() => gender = val ?? 'Male'),
                onSaved: (val) => gender = val ?? 'Male',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Blood Group'),
                onSaved: (val) => bloodGroup = val ?? '',
                validator:
                    (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Child'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
