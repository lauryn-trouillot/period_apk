import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoWidget extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  const InfoWidget({
    Key? key,
    this.startDate,
    this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime? date) {
      if (date == null) return 'Non défini';
      return DateFormat.yMMMMd('fr').format(date);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Début des règles : ${formatDate(startDate)}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Fin des règles : ${formatDate(endDate)}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
