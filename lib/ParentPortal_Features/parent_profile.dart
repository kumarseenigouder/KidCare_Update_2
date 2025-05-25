import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'AddChildProfile.dart';

class ParentProfileTab extends StatefulWidget {
  const ParentProfileTab({super.key});

  @override
  State<ParentProfileTab> createState() => _ParentProfileTabState();
}

class _ParentProfileTabState extends State<ParentProfileTab> {
  File? _profileImage;

  final Map<String, String> parentDetails = {
    'motherName': 'Areeba Malik',
    'motherAge': '34',
    'motherBlood': 'B+',
    'fatherName': 'Rehan Malik',
    'fatherAge': '36',
    'fatherBlood': 'O+',
    'location': 'Karachi, Pakistan',
  };

  List<Map<String, dynamic>> children = [
    {
      'name': 'Ayaan Malik',
      'age': 6,
      'gender': 'Male',
      'bloodGroup': 'A+',
      'appointments': [
        {
          'doctor': 'Dr. Saira Anjum',
          'specialty': 'Orthopedic Surgeon',
          'date': '2025-04-10',
        },
        {
          'doctor': 'Dr. Rehan Malik',
          'specialty': 'Pediatrician',
          'date': '2025-03-05',
        },
      ],
      'image': null,
    },
  ];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _navigateToAddChildForm() async {
    final newChild = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => AddChildFormScreen(parentDetails: parentDetails),
      ),
    );

    if (newChild != null) {
      setState(() => children.add(newChild));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Family Profile',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/images/baby.jpg')
                            as ImageProvider,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    backgroundColor: Colors.purple.shade100,
                    child: const Icon(Icons.edit, size: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildChildBasicDetails(children[0]),
          const SizedBox(height: 24),
          _buildParentDetails(),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Children Profiles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          if (children.length > 1)
            ...children.sublist(1).asMap().entries.map((entry) {
              int index = entry.key + 1; // Adjust index for full list
              var child = children[index];
              return _buildChildCard(child, index);
            }),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _navigateToAddChildForm,
            icon: const Icon(Icons.add),
            label: const Text('Add Child'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink.shade200,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildBasicDetails(Map<String, dynamic> child) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Child Basic Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            _buildDetailRow('Name', child['name']),
            _buildDetailRow('Age', '${child['age']}'),
            _buildDetailRow('Gender', child['gender']),
            _buildDetailRow('Blood Group', child['bloodGroup']),
          ],
        ),
      ),
    );
  }

  Widget _buildParentDetails() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Parent Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            _buildDetailRow('Mother', parentDetails['motherName']!),
            _buildDetailRow('Age', parentDetails['motherAge']!),
            _buildDetailRow('Blood Group', parentDetails['motherBlood']!),
            const SizedBox(height: 10),
            _buildDetailRow('Father', parentDetails['fatherName']!),
            _buildDetailRow('Age', parentDetails['fatherAge']!),
            _buildDetailRow('Blood Group', parentDetails['fatherBlood']!),
            const SizedBox(height: 10),
            _buildDetailRow('Location', parentDetails['location']!),
          ],
        ),
      ),
    );
  }

  Widget _buildChildCard(Map<String, dynamic> child, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      child['image'] != null
                          ? FileImage(File(child['image']))
                          : const AssetImage('assets/images/baby.jpg')
                              as ImageProvider,
                  radius: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  child['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildDetailRow('Age', '${child['age']}'),
            _buildDetailRow('Gender', child['gender']),
            _buildDetailRow('Blood Group', child['bloodGroup']),
            const SizedBox(height: 12),
            const Text(
              'Previous Appointments',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            ...(child['appointments'] as List).map((apptRaw) {
              final appt = Map<String, dynamic>.from(apptRaw);
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(appt['doctor'] ?? ''),
                subtitle: Text(appt['specialty'] ?? ''),
                trailing: Text(appt['date'] ?? ''),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
