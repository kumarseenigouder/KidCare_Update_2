// in admin_portal.dart
import 'package:flutter/material.dart';

class AdminPortal extends StatefulWidget {
  const AdminPortal({super.key});

  @override
  State<AdminPortal> createState() => _AdminPortalState();
}

class _AdminPortalState extends State<AdminPortal> {
  List<String> doctors = ['Dr. Smith', 'Dr. Maria'];
  List<String> children = ['John Doe (Age 5)', 'Lucy Heartfilia (Age 4)'];

  void _addEntry({required bool isDoctor}) {
    String title = isDoctor ? "Add Doctor" : "Add Child";
    String hint = isDoctor ? "Enter doctor name" : "Enter child details";

    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: hint),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (controller.text.trim().isNotEmpty) {
                    setState(() {
                      if (isDoctor) {
                        doctors.add(controller.text.trim());
                      } else {
                        children.add(controller.text.trim());
                      }
                    });
                  }
                },
                child: const Text("Add"),
              ),
            ],
          ),
    );
  }

  void _removeEntry({required bool isDoctor, required int index}) {
    setState(() {
      if (isDoctor) {
        doctors.removeAt(index);
      } else {
        children.removeAt(index);
      }
    });
  }

  Widget _buildSection(String title, List<String> data, bool isDoctor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addEntry(isDoctor: isDoctor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            data.isEmpty
                ? const Text("No records found")
                : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder:
                      (context, index) => ListTile(
                        title: Text(data[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed:
                              () => _removeEntry(
                                isDoctor: isDoctor,
                                index: index,
                              ),
                        ),
                      ),
                ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Portal")),
      body: LayoutBuilder(
        builder:
            (context, constraints) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSection("Active Doctors", doctors, true),
                    _buildSection("Child Records", children, false),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
