import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VaccinationSchedulePage extends StatefulWidget {
  const VaccinationSchedulePage({super.key});

  @override
  State<VaccinationSchedulePage> createState() =>
      _VaccinationSchedulePageState();
}

class _VaccinationSchedulePageState extends State<VaccinationSchedulePage> {
  DateTime? selectedDate;
  String? selectedVaccineType;

  final List<String> vaccineTypes = [
    'MMR (Measles, Mumps, Rubella)',
    'DTaP (Diphtheria, Tetanus, Pertussis)',
    'Polio',
    'Hepatitis B',
    'Influenza',
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedSchedule();
  }

  Future<void> _loadSavedSchedule() async {
    final prefs = await SharedPreferences.getInstance();
    final dateStr = prefs.getString('scheduledDate');
    final vaccine = prefs.getString('vaccineType');
    final name = prefs.getString('childName') ?? '';
    final age = prefs.getString('childAge') ?? '';
    final address = prefs.getString('childAddress') ?? '';

    if (dateStr != null && vaccine != null && vaccine.isNotEmpty) {
      setState(() {
        selectedDate = DateTime.tryParse(dateStr);
        selectedVaccineType = vaccine;
        nameController.text = name;
        ageController.text = age;
        addressController.text = address;
      });
    }
  }

  Future<void> _saveSchedule() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('scheduledDate', selectedDate!.toIso8601String());
    await prefs.setString('vaccineType', selectedVaccineType ?? '');
    await prefs.setString('childName', nameController.text);
    await prefs.setString('childAge', ageController.text);
    await prefs.setString('childAddress', addressController.text);
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _submit() {
    if (selectedDate != null &&
        selectedVaccineType != null &&
        nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        addressController.text.isNotEmpty) {
      _saveSchedule();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Vaccination scheduled for ${selectedDate!.toLocal().toString().split(' ')[0]} (${selectedVaccineType!})",
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, {
        'date': selectedDate,
        'type': selectedVaccineType,
        'childName': nameController.text,
        'childAge': ageController.text,
        'childAddress': addressController.text,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please complete all details."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F8),
      appBar: AppBar(
        title: const Text("Schedule Vaccination"),
        backgroundColor: Colors.pinkAccent.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.shade100.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.vaccines_rounded,
                  size: 60,
                  color: Colors.pink,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Enter Child Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                /// Name
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Child's Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                /// Age
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Child's Age",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                /// Address
                TextField(
                  controller: addressController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: "Child's Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  "Select Vaccine and Date",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                /// Vaccine Dropdown
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: "Select Vaccine Type",
                    border: OutlineInputBorder(),
                  ),
                  value: selectedVaccineType,
                  items:
                      vaccineTypes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedVaccineType = val;
                    });
                  },
                ),
                const SizedBox(height: 20),

                /// Date Picker
                ElevatedButton.icon(
                  onPressed: _selectDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text("Pick a Date"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                if (selectedDate != null || selectedVaccineType != null) ...[
                  Text(
                    "Scheduled Info:",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Date: ${selectedDate?.toLocal().toString().split(' ')[0] ?? 'Not selected'}",
                  ),
                  Text("Vaccine: ${selectedVaccineType ?? 'Not selected'}"),
                  Text("Name: ${nameController.text}"),
                  Text("Age: ${ageController.text}"),
                  Text("Address: ${addressController.text}"),
                  const SizedBox(height: 24),
                ],

                /// Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      "Confirm Schedule",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
