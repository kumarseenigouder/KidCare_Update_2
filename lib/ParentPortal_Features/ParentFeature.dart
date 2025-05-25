import 'package:flutter/material.dart';
import '../feature_screen.dart';
import 'ParentAdviceScreen.dart';
import 'meds_screen.dart';

class ParentFeaturesTab extends StatelessWidget {
  const ParentFeaturesTab({super.key});

  void _goToFeature(BuildContext context, String title) {
    Widget screen;

    switch (title) {
      case "Parent Advice":
        screen = ParentAdviceScreen(); // Specific screen
        break;
      case "Meds":
        screen = MedsScreen(); // ✅ This is already perfect
        break;
      default:
        screen = FeatureScreen(title: title); // Generic fallback screen
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final List<_PortalFeature> features = [
      _PortalFeature(
        "Symptoms",
        Icons.monitor_heart,
        () => _goToFeature(context, "Symptoms"),
      ),
      _PortalFeature(
        "Parent Advice",
        Icons.family_restroom,
        () => _goToFeature(context, "Parent Advice"),
      ),
      _PortalFeature(
        "Meds",
        Icons.medication,
        () => _goToFeature(context, "Meds"),
      ),
      _PortalFeature(
        "Locations",
        Icons.location_on,
        () => _goToFeature(context, "Locations"),
      ),
      _PortalFeature(
        "Find a Doctor",
        Icons.person_search,
        () => _goToFeature(context, "Find a Doctor"),
      ),
      _PortalFeature(
        "MyChart",
        Icons.assignment_ind,
        () => _goToFeature(context, "MyChart"),
      ),
      _PortalFeature(
        "Emergency",
        Icons.local_hospital,
        () => _goToFeature(context, "Emergency"),
      ),
      _PortalFeature(
        "Behavioral",
        Icons.psychology,
        () => _goToFeature(context, "Behavioral"),
      ),
      _PortalFeature(
        "First Aid",
        Icons.medical_services,
        () => _goToFeature(context, "First Aid"),
      ),
      _PortalFeature(
        "Conditions",
        Icons.list,
        () => _goToFeature(context, "Conditions"),
      ),
      _PortalFeature(
        "Profiles",
        Icons.group,
        () => _goToFeature(context, "Profiles"),
      ),
      _PortalFeature(
        "Donate",
        Icons.handshake,
        () => _goToFeature(context, "Donate"),
      ),
      _PortalFeature(
        "Bill Pay",
        Icons.attach_money,
        () => _goToFeature(context, "Bill Pay"),
      ),
      _PortalFeature(
        "Contact Us",
        Icons.phone,
        () => _goToFeature(context, "Contact Us"),
      ),
      _PortalFeature(
        "Settings",
        Icons.settings,
        () => _goToFeature(context, "Settings"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Features"),
        backgroundColor: const Color(0xFFFFF3F8),
      ),
      backgroundColor: Colors.pink[50],
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // ✅ Only 1 item per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 0, // Not needed with 1 column
          childAspectRatio: 5, // ✅ Makes it look like a wide button
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return InkWell(
            onTap: feature.onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    feature.icon,
                    size: 36,
                    color: const Color.fromARGB(255, 207, 141, 163),
                  ),
                  const SizedBox(width: 16),
                  Text(feature.title, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Shared class between all tabs and features
class _PortalFeature {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _PortalFeature(this.title, this.icon, this.onTap);
}
