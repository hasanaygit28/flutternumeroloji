import 'package:flutter/material.dart';
import 'numerology_results_screen.dart'; 

class NumerologyScreen extends StatefulWidget {
  const NumerologyScreen({super.key});

  @override
  NumerologyScreenState createState() => NumerologyScreenState();
}

class NumerologyScreenState extends State<NumerologyScreen> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _birthDateController = TextEditingController();

  void _calculateNumerology() {
    String name = _nameController.text.trim();
    String surname = _surnameController.text.trim();
    String birthDate = _birthDateController.text.trim();

    if (name.isEmpty || surname.isEmpty || birthDate.isEmpty) {
      _showErrorDialog("Lütfen tüm alanları doldurun!");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NumerologyResultsScreen(
          name: name,
          surname: surname,
          birthDate: birthDate,
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hata"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Tamam"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numeroloji Hesaplayıcı'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Adınız',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Soyadınız',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _birthDateController,
              decoration: InputDecoration(
                labelText: 'Doğum Tarihiniz (GG/AA/YYYY)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                prefixIcon: Icon(Icons.calendar_today),
              ),
              
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateNumerology,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Hesapla'),
            ),
          ],
        ),
      ),
    );
  }
}