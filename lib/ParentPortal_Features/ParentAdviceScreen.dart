import 'package:flutter/material.dart';
import 'Advice_Details_Content.dart';

class ParentAdviceScreen extends StatelessWidget {
  final List<String> ageGroups = [
    "Newborn",
    "Infant",
    "Toddler",
    "Preschool",
    "School-age",
    "Teen",
  ];
  final Map<String, List<Map<String, dynamic>>> adviceContent = {
    "Newborn": [
      {
        "title": "Safe Sleep Tips",
        "summary":
            "Learn how to reduce the risk of SIDS with proper sleep habits.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
      {
        "title": "Feeding Routine",
        "summary": "Tips for breastfeeding and bottle-feeding your newborn.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
    ],
    "Toddler": [
      {
        "title": "Dealing with Tantrums",
        "summary":
            "Tantrums are common. Stay calm and respond with consistent routines.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
      {
        "title": "Introducing New Foods",
        "summary":
            "Expose toddlers to different flavors and textures for better eating habits.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
    ],

    "Infant": [
      {
        "title": "Nutrition for Infants",
        "summary": "Start solids around 6 months while continuing milk feeds.",
        "details": [
          "At around 6 months, your baby will be ready to begin solid foods, but breast milk or formula should still be their main source of nutrition. Begin with iron-fortified cereals and pureed vegetables or fruits. These are easy for babies to digest. Over time, introduce a variety of textures such as mashed, finely chopped, and soft finger foods. This will help them learn how to chew and swallow. Continue breastfeeding or formula feeding alongside solids, as this provides the essential nutrients your baby needs for growth and development. Always pay attention to your baby’s cues for hunger and fullness, and avoid adding salt, sugar, or honey to their food at this stage.",
        ],
      },
      {
        "title": "Infant Sleep Patterns",
        "summary": "Most babies sleep longer by 6 months.",
        "details": [
          "By the time your baby reaches 6 months, they are likely to sleep for longer stretches during the night, often 6-8 hours. To help them settle into a healthy sleep routine, try to establish a calm and predictable bedtime routine. This could include activities like a warm bath, a gentle massage, or reading a short story. Keep the environment quiet and dark to signal that it’s time for sleep. It’s also important to help your baby differentiate between day and night by exposing them to natural light during the day and keeping the nighttime environment quiet and dim. If your baby wakes up at night, try soothing them with gentle rocking or comforting without picking them up immediately, as this can help them learn to self-soothe.",
        ],
      },
      {
        "title": "Infant Developmental Milestones",
        "summary": "Encourage movement and interaction daily.",
        "details": [
          "At this stage, your baby is rapidly developing their motor skills. To support this, give them plenty of tummy time while they are awake. Tummy time helps build the muscles in their neck, back, and arms, which are essential for rolling, sitting, and crawling later on. As your baby grows, create a safe space for them to explore, whether it’s by rolling over, reaching for toys, or crawling. Engage with them by talking, singing, and reading aloud, which supports their brain and language development. Responding to their sounds and expressions helps foster communication skills and emotional bonding.",
        ],
      },
      {
        "title": "Infant Safety Tips",
        "summary": "Ensure your home is baby-safe and use car seats correctly.",
        "details": [
          "Safety is a top priority for your baby. Always use a rear-facing car seat for your infant until they reach the highest weight or height allowed by the car seat manufacturer. Baby-proof your home by covering electrical outlets with safety covers, using safety gates to block stairs, and securing furniture to walls to prevent it from tipping over. Keep small objects out of reach to avoid choking hazards. In the kitchen, make sure sharp objects and hot liquids are out of baby’s reach. It’s also important to place your baby on their back to sleep to reduce the risk of sudden infant death syndrome (SIDS). Always monitor your baby’s movements, especially when they begin to crawl, and keep potentially dangerous items out of their way.",
        ],
      },
    ],
    "Preschool": [
      {
        "title": "Dealing with Tantrums",
        "summary":
            "Tantrums are common. Stay calm and respond with consistent routines.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
      {
        "title": "Introducing New Foods",
        "summary":
            "Expose toddlers to different flavors and textures for better eating habits.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
    ],

    "School-age": [
      {
        "title": "Dealing with Tantrums",
        "summary":
            "Tantrums are common. Stay calm and respond with consistent routines.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
      {
        "title": "Introducing New Foods",
        "summary":
            "Expose toddlers to different flavors and textures for better eating habits.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
    ],

    "Teen": [
      {
        "title": "Dealing with Tantrums",
        "summary":
            "Tantrums are common. Stay calm and respond with consistent routines.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
      {
        "title": "Introducing New Foods",
        "summary":
            "Expose toddlers to different flavors and textures for better eating habits.",
        "details": [
          "Always place your baby on their back to sleep for naps and nighttime.",
          "Use a firm, flat sleep surface in a safety-approved crib, bassinet, or play yard.",
          "Keep soft objects and loose bedding out of the sleep area (no pillows, blankets, or toys).",
          "Share your room, not your bed – keep the baby's sleep area in the same room where you sleep.",
          "Avoid overheating: dress your baby in light sleep clothing.",
          "Breastfeed or offer formula every 2–3 hours during the day and night.",
          "Watch for hunger cues like rooting, sucking motions, or crying.",
          "Always burp your baby after each feeding to reduce discomfort and aid digestion.",
          "Night feedings can also promote bonding and reduce SIDS risk when combined with safe sleep practices.",
        ],
      },
    ],
    // Add other age groups as needed
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ageGroups.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Parent Advice"),
          bottom: TabBar(
            isScrollable: true,
            tabs: ageGroups.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: Column(
          children: [
            _buildDailyTip(context),
            Expanded(
              child: TabBarView(
                children:
                    ageGroups.map((group) {
                      final tips = adviceContent[group] ?? [];
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 600;
                          return GridView.builder(
                            padding: const EdgeInsets.all(12),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isWide ? 2 : 1,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: isWide ? 3 : 2.5,
                                ),
                            itemCount: tips.length,
                            itemBuilder: (context, index) {
                              final tip = tips[index];
                              return _buildAdviceCard(
                                context,
                                tip["title"]!,
                                tip["summary"]!,
                                tip["details"]!,
                              );
                            },
                          );
                        },
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyTip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.lightbulb_outline,
            color: Color.fromARGB(255, 247, 145, 179),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Daily Tip: Talk to your baby often—even if they can’t talk back yet.",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdviceCard(
    BuildContext context,
    String title,
    String summary,
    List<String> details,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                summary,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: const Text("Read More"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => AdviceDetailScreen(
                            title: title,
                            summary: summary,
                            details: details,
                          ),
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
