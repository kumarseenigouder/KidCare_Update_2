import 'package:flutter/material.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({super.key});

  final List<Map<String, String>> _diseases = const [
    {"name": "Common Cold", "symptom": "Sneezing, cough, runny nose"},
    {"name": "Flu (Influenza)", "symptom": "Fever, chills, body aches"},
    {"name": "Chickenpox", "symptom": "Itchy rash, fever, fatigue"},
    {"name": "Measles", "symptom": "Rash, fever, cough, runny nose"},
    {"name": "Mumps", "symptom": "Swollen glands, fever, headache"},
    {
      "name": "Hand, Foot and Mouth Disease",
      "symptom": "Sores in mouth, rash on hands and feet",
    },
    {"name": "Ear Infection", "symptom": "Ear pain, fever, trouble hearing"},
    {
      "name": "Croup",
      "symptom": "Barking cough, hoarseness, trouble breathing",
    },
    {
      "name": "Whooping Cough",
      "symptom": "Severe coughing fits, vomiting after cough",
    },
    {
      "name": "Bronchiolitis",
      "symptom": "Wheezing, cough, difficulty breathing",
    },
    // ...Add more here up to 100
    {"name": "Scarlet Fever", "symptom": "Red rash, sore throat, high fever"},
    {"name": "Pneumonia", "symptom": "Chest pain, cough with phlegm, fever"},
    {
      "name": "Asthma",
      "symptom": "Wheezing, shortness of breath, chest tightness",
    },
    {"name": "Strep Throat", "symptom": "Sore throat, fever, red tonsils"},
    {"name": "Tonsillitis", "symptom": "Sore throat, difficulty swallowing"},
    {"name": "Sinusitis", "symptom": "Nasal congestion, headache, facial pain"},
    {
      "name": "Allergic Rhinitis",
      "symptom": "Sneezing, itchy eyes, runny nose",
    },
    {"name": "Conjunctivitis (Pink Eye)", "symptom": "Red, itchy, watery eyes"},
    {
      "name": "RSV (Respiratory Syncytial Virus)",
      "symptom": "Cough, wheezing, difficulty breathing",
    },
    {"name": "Diarrhea", "symptom": "Frequent loose stools, dehydration"},
    // Add more as needed to reach 100
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Child Diseases & Symptoms")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _diseases.length,
        itemBuilder: (context, index) {
          final disease = _diseases[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.sick, color: Colors.pink),
              title: Text(
                disease["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Symptoms: ${disease["symptom"]}"),
            ),
          );
        },
      ),
    );
  }
}
