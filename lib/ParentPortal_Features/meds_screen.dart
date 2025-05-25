import 'package:flutter/material.dart';

class MedsScreen extends StatefulWidget {
  const MedsScreen({super.key});

  @override
  State<MedsScreen> createState() => _MedsScreenState();
}

class _MedsScreenState extends State<MedsScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _generalMeds = ["Paracetamol", "Ibuprofen"];
  final TextEditingController _medController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  final List<Map<String, String>> _inbuiltDiseaseMeds = [
    {
      'disease': 'Common Cold',
      'symptom': 'Runny nose, sneezing, cough, low-grade fever',
      'medication': 'Paracetamol (Tylenol/Calpol)',
      'dose': '10-15 mg/kg every 4-6 hrs (max 5 doses/day)',
    },
    {
      'disease': 'Fever (Viral)',
      'symptom': 'High temperature, chills, fatigue',
      'medication': 'Paracetamol or Ibuprofen',
      'dose': 'Paracetamol: 10-15 mg/kg, Ibuprofen: 5-10 mg/kg every 6–8 hrs',
    },
    {
      'disease': 'Diarrhea',
      'symptom': 'Loose stools, dehydration, irritability',
      'medication': 'ORS, Zinc',
      'dose': 'ORS: 50–100 mL/kg/day; Zinc: 10 mg/day for 10–14 days',
    },
    {
      'disease': 'Constipation',
      'symptom': 'Hard stools, straining, stomach pain',
      'medication': 'Lactulose, Fiber-rich diet',
      'dose': 'Lactulose: 0.5–1 mL/kg once or twice daily',
    },
    {
      'disease': 'Vomiting',
      'symptom': 'Nausea, dehydration, weakness',
      'medication': 'Ondansetron (Zofran)',
      'dose': '0.1–0.15 mg/kg every 8 hrs (max 4 mg)',
    },
    {
      'disease': 'Ear Infection (Otitis Media)',
      'symptom': 'Ear pain, fever, irritability',
      'medication': 'Amoxicillin',
      'dose': '40–90 mg/kg/day in 2 doses for 7–10 days',
    },
    {
      'disease': 'Pneumonia',
      'symptom': 'Cough, fever, fast breathing',
      'medication': 'Amoxicillin, Azithromycin',
      'dose':
          'Amoxicillin: 90 mg/kg/day, Azithro: 10 mg/kg (day 1), then 5 mg/kg/day',
    },
    {
      'disease': 'Tonsillitis',
      'symptom': 'Sore throat, difficulty swallowing',
      'medication': 'Amoxicillin or Penicillin',
      'dose': 'Amoxicillin: 40–90 mg/kg/day in divided doses',
    },
    {
      'disease': 'Hand, Foot, and Mouth Disease',
      'symptom': 'Fever, blisters on mouth/hands/feet',
      'medication': 'Paracetamol, fluids',
      'dose': 'Paracetamol: 10–15 mg/kg',
    },
    {
      'disease': 'Chickenpox',
      'symptom': 'Rash, fever, itching',
      'medication': 'Calamine lotion, Paracetamol (no aspirin)',
      'dose': 'Paracetamol: 10–15 mg/kg',
    },
    {
      'disease': 'Eczema',
      'symptom': 'Dry/itchy patches, redness',
      'medication': 'Emollients, Hydrocortisone 1%',
      'dose': 'Apply thin layer 1–2x/day for 5–7 days',
    },
    {
      'disease': 'Infantile Colic',
      'symptom': 'Crying >3 hrs/day, gassiness',
      'medication': 'Simethicone drops',
      'dose': '20 mg up to 4x/day',
    },
    {
      'disease': 'Croup',
      'symptom': 'Barking cough, hoarseness',
      'medication': 'Dexamethasone, humid air',
      'dose': 'Dexamethasone: 0.15–0.6 mg/kg single dose',
    },
    {
      'disease': 'Worm Infestation',
      'symptom': 'Itchy bottom, weight loss, stomach pain',
      'medication': 'Albendazole',
      'dose': '200 mg (2–5 yrs), 400 mg (5–8 yrs) single dose',
    },
    {
      'disease': 'Asthma',
      'symptom': 'Wheezing, breathlessness',
      'medication': 'Salbutamol syrup/inhaler',
      'dose': '0.1–0.2 mg/kg orally or via inhaler',
    },
    {
      'disease': 'Measles',
      'symptom': 'Rash, cough, runny nose, red eyes',
      'medication': 'Vitamin A, supportive care',
      'dose': 'Vitamin A: 200,000 IU for 2 days',
    },
    {
      'disease': 'Dengue Fever',
      'symptom': 'High fever, body pain, rash',
      'medication': 'Paracetamol, fluids',
      'dose': 'Paracetamol: 10–15 mg/kg every 4-6 hrs',
    },
    {
      'disease': 'Scabies',
      'symptom': 'Severe itching, burrows in skin',
      'medication': 'Permethrin cream',
      'dose': 'Apply over entire body, leave for 8–14 hrs then wash off',
    },
    {
      'disease': 'Mumps',
      'symptom': 'Swollen cheeks, jaw pain, fever',
      'medication': 'Supportive care, fluids, paracetamol',
      'dose': 'Paracetamol: 10–15 mg/kg',
    },
    {
      'disease': 'Conjunctivitis',
      'symptom': 'Red eyes, discharge, itching',
      'medication': 'Antibiotic eye drops',
      'dose': 'As directed 3–4x/day',
    },
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  void _addGeneralMedication() {
    if (_medController.text.trim().isNotEmpty) {
      setState(() {
        _generalMeds.add(_medController.text.trim());
        _medController.clear();
      });
    }
  }

  void _removeGeneralMedication(int index) {
    setState(() {
      _generalMeds.removeAt(index);
    });
  }

  @override
  void dispose() {
    _medController.dispose();
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildGeneralMedicationsTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add or track your medications:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _medController,
            decoration: InputDecoration(
              labelText: "Medication name",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addGeneralMedication,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Medication List:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _generalMeds.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_generalMeds[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeGeneralMedication(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInbuiltDiseaseMedicationsTab() {
    final filteredMeds =
        _inbuiltDiseaseMeds
            .where((med) => med['disease']!.toLowerCase().contains(_searchText))
            .toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Children Disease Medications:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search by disease name...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMeds.length,
              itemBuilder: (context, index) {
                final item = filteredMeds[index];
                return Card(
                  child: ListTile(
                    title: Text(item['disease']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Symptoms: ${item['symptom']}"),
                        Text("Medication: ${item['medication']}"),
                        Text("Dose: ${item['dose']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Medications"),
          backgroundColor: Colors.pink,
          bottom: TabBar(
            controller: _tabController,
            tabs: const [Tab(text: "Disease Info"), Tab(text: "General Meds")],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildInbuiltDiseaseMedicationsTab(), // Now first
            _buildGeneralMedicationsTab(), // Now second
          ],
        ),
      ),
    );
  }
}
