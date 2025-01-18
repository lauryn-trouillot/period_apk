import 'package:flutter/material.dart';
import '../models/user_info.dart';

class SettingsScreen extends StatefulWidget {
  final UserInfo userInfo;
  final Function(UserInfo) onSave;

  const SettingsScreen({
    Key? key,
    required this.userInfo,
    required this.onSave,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _firstName;
  late String _lastName;
  late int _cycleLength;

  @override
  void initState() {
    super.initState();
    _firstName = widget.userInfo.firstName;
    _lastName = widget.userInfo.lastName;
    _cycleLength = widget.userInfo.cycleLength;
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSave(UserInfo(
        firstName: _firstName,
        lastName: _lastName,
        cycleLength: _cycleLength,
        periodDays: widget.userInfo.periodDays,
      ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _firstName,
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prénom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _firstName = value!;
                },
              ),
              TextFormField(
                initialValue: _lastName,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastName = value!;
                },
              ),
              TextFormField(
                initialValue: _cycleLength.toString(),
                decoration: const InputDecoration(
                    labelText: 'Longueur du cycle (jours)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la longueur du cycle';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Veuillez entrer un nombre valide';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cycleLength = int.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
