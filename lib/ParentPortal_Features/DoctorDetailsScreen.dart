import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'BookingConfirmationScreen.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String name;
  final String specialty;
  final String image;

  const DoctorDetailsScreen({
    Key? key,
    required this.name,
    required this.specialty,
    required this.image,
  }) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDateTime() async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        final appointmentDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          selectedTime!.hour,
          selectedTime!.minute,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => BookingConfirmationScreen(
                  doctorName: widget.name,
                  dateTime: appointmentDateTime,
                ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEFFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Doctor Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(widget.image),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.specialty,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const Text(
                        "Available to chat",
                        style: TextStyle(color: Colors.green),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _infoBox("1.2K", "Patients"),
                          const SizedBox(width: 10),
                          _infoBox("2 Years", "Experience"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Spacer(),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  "4.5/5",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "Try this pose out for something that helps that Try this pose out for something that helps that Try this pose out for something that helps that.",
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _roundedButton(
                    "Book a Video Call",
                    Colors.pink,
                    () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _roundedButton(
                    "Start Chat",
                    const Color(0xFFF8BBD0),
                    () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _serviceList()),
                const SizedBox(width: 10),
                Expanded(child: _serviceList()),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Patient Review",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text(
              "89% of patients recommended this doctor. Based on 89 reviews.",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _pickDateTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoBox(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          Text(subtitle, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _roundedButton(String label, Color color, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  static Widget _serviceList() {
    const services = [
      "PCOS Tracking",
      "Muscle Pain",
      "Knee Pain",
      "Tracking now",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          services
              .map(
                (s) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text("• $s"),
                ),
              )
              .toList(),
    );
  }
}
