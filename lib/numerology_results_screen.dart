import 'package:flutter/material.dart';
import 'numerology_calculator.dart';

class NumerologyResultsScreen extends StatefulWidget {
  final String name;
  final String surname;
  final String birthDate;

  const NumerologyResultsScreen({
    super.key,
    required this.name,
    required this.surname,
    required this.birthDate,
  });

  @override
  NumerologyResultsScreenState createState() => NumerologyResultsScreenState();
}

class NumerologyResultsScreenState extends State<NumerologyResultsScreen> {
  @override
  Widget build(BuildContext context) {
    String fullName = (widget.name + widget.surname).toUpperCase();
    int lifePathNumber = NumerologyCalculator.calculateLifePathNumber(widget.birthDate);
    int destinyNumber = NumerologyCalculator.calculateDestinyNumber(fullName);
    int soulUrgeNumber = NumerologyCalculator.calculateSoulUrgeNumber(fullName);
    int personalityNumber = NumerologyCalculator.calculatePersonalityNumber(fullName);

    return Scaffold(
      appBar: AppBar(
        title: Text('Numeroloji Sonuçları'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${widget.name} ${widget.surname} - Numerolojik Değerleriniz:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yaşam Yolu Sayısı: $lifePathNumber",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary, 
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      NumerologyCalculator.getNumerologyMeaning(lifePathNumber),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kader Sayısı: $destinyNumber",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary, 
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      NumerologyCalculator.getNumerologyMeaning(destinyNumber),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ruh Arzusu Sayısı: $soulUrgeNumber",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary, 
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      NumerologyCalculator.getNumerologyMeaning(soulUrgeNumber),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kişilik Sayısı: $personalityNumber",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      NumerologyCalculator.getNumerologyMeaning(personalityNumber),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}