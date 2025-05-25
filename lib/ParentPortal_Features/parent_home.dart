import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'VaccinationSchedule.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String patientName = "Ayaan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 30),
            _buildDailyTipCard(),
            const SizedBox(height: 20),
            _buildVaccinationSection(context),
            const SizedBox(height: 20),
            _buildDoctorWebinars(context),
            const SizedBox(height: 20),
            _buildChildEvents(),
            const SizedBox(height: 20),
            _buildNewsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFEC8D8), Color(0xFFFCD5CE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/2966/2966485.png',
            height: 80,
            width: 80,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, $patientName 👶',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Your baby is now 12 weeks old!',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyTipCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.tips_and_updates, size: 40, color: Colors.pink),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Daily Tip",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Tummy time helps strengthen your baby’s neck and shoulder muscles.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVaccinationSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF4FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming Vaccination",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.vaccines, color: Colors.blueAccent),
              const SizedBox(width: 12),
              const Expanded(
                child: Text("Polio Booster - Scheduled for: 2025-06-10"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VaccinationSchedulePage(),
                    ),
                  );
                },

                child: const Text("Schedule Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorWebinars(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Doctor Webinars",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _videoCard(
          context: context,
          thumbnail:
              'https://img.freepik.com/free-vector/doctor-video-conference-illustration_23-2148543080.jpg',
          title: 'Vaccination Guidelines',
          doctor: 'Dr. Sara Imran',
        ),
        _videoCard(
          context: context,
          thumbnail:
              'https://img.freepik.com/free-vector/telemedicine-healthcare-illustration_23-2148826898.jpg',
          title: 'Child Sleep Routines',
          doctor: 'Dr. Ahmed Naveed',
        ),
      ],
    );
  }

  Widget _videoCard({
    required BuildContext context,
    required String thumbnail,
    required String title,
    required String doctor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 6),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              thumbnail,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text('By $doctor', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.play_circle_fill,
              color: Colors.pink,
              size: 30,
            ),
            onPressed: () {
              context.go('/webinar-details');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChildEvents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upcoming Child Events",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _eventCard(
          date: "May 30",
          title: "Toddler Playdate Meetup",
          location: "Karachi Kids Club",
        ),
        _eventCard(
          date: "June 5",
          title: "Nutrition Workshop",
          location: "Children’s Hospital Auditorium",
        ),
      ],
    );
  }

  Widget _eventCard({
    required String date,
    required String title,
    required String location,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.purple.shade100,
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(location, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Articles For You",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _newsTile(
          context: context,
          image:
              'https://img.freepik.com/free-vector/doctor-checking-little-boy-sick-bed_74855-5826.jpg',
          title: 'Is It Time For Vaccination?',
          subtitle: 'How to prepare your child for the next dose.',
        ),
        _newsTile(
          context: context,
          image:
              'https://img.freepik.com/free-vector/mother-feeding-her-baby-boy-home_74855-16161.jpg',
          title: '5 Toddler Nutrition Myths',
          subtitle: 'Let\'s break some common misconceptions.',
        ),
      ],
    );
  }

  Widget _newsTile({
    required BuildContext context,
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          context.go('/article-details');
        },
      ),
    );
  }
}
