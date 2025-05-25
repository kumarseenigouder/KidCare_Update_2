import 'package:flutter/material.dart';
import 'ParentPortal_Features/DoctorDetailsScreen.dart';

// Doctor data
final List<Map<String, String>> doctors = [
  {
    'name': 'Dr. PAVAN U',
    'specialty': 'Orthopedic Surgeon',
    'image': 'assets/images/pavan.jpg',
  },
  {
    'name': 'Dr. KUMAR S',
    'specialty': 'Gynecologist',
    'image': 'assets/doctor2.png',
  },
];

class ParentAppointmentsTab extends StatelessWidget {
  const ParentAppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F8), // Matching background color
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Appointments',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Card(
                    color: Colors.white, // Consistent with other pages
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(doctor['image']!),
                        radius: 30,
                      ),
                      title: Text(
                        doctor['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(doctor['specialty']!),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => DoctorDetailsScreen(
                                  name: doctor['name']!,
                                  specialty: doctor['specialty']!,
                                  image: doctor['image']!,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
