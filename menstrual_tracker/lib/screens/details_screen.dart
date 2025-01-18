import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Ajouté pour utiliser DateFormat

class DetailsScreen extends StatelessWidget {
  final DateTime selectedDay;
  final Function(DateTime) onSaveStartDate;
  final Function(DateTime) onSaveEndDate;

  const DetailsScreen({
    Key? key,
    required this.selectedDay,
    required this.onSaveStartDate,
    required this.onSaveEndDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedDate = DateFormat.yMMMMd('fr').format(selectedDay);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la date'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Date sélectionnée : $selectedDate',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                onSaveStartDate(selectedDay);
                Navigator.pop(context);
              },
              child: const Text('Définir comme début des règles'),
            ),
            ElevatedButton(
              onPressed: () {
                onSaveEndDate(selectedDay);
                Navigator.pop(context);
              },
              child: const Text('Définir comme fin des règles'),
            ),
            // Ajouter d'autres boutons ou champs pour les symptômes ici
          ],
        ),
      ),
    );
  }
}
